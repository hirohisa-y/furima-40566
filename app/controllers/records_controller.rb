class RecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create ]
  before_action :access_index, only: [:index]
  before_action :access_my_index, only: [:index]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @form = Form.new
  end

  def create
    @form = Form.new(form_params)
    if @form.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
      Payjp::Charge.create(
        amount: @item.price, 
        card: form_params[:token],    
        currency: 'jpy'                
      )
       @form.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private
  def form_params
    params.require(:form).permit(:post_code, :prefecture_id, :municipality, :street_address, :building_name, :telephone_number ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token] )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def access_index
    if current_user != @item.user && @item.record.present?
      redirect_to root_path
    end
  end

  def access_my_index
    if current_user == @item.user
      redirect_to root_path
    end
  end
end
