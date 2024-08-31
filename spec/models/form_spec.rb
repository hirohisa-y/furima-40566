require 'rails_helper'

RSpec.describe Form, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @form = FactoryBot.build(:form, user_id: user.id, item_id: item.id)
  end

  describe '配送先登録' do
    context '配送先登録できる場合' do
      it "post_codeと,prefecture_id,municipality,street_address,telephone_number,building_nameとtokenが存在すれば登録できる" do
        expect(@form).to be_valid
      end

      it "building_nameが空でも登録できる" do
        @form.building_name = ''
        expect(@form).to be_valid
      end
    end

    context '配送先登録できない場合' do
      it "post_codeが空では登録できない" do
        @form.post_code = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Post code can't be blank")
      end

      it "prefecture_idが空では登録できない" do
        @form.prefecture_id = 1
        @form.valid?
        expect(@form.errors.full_messages).to include("Prefecture select")
      end

      it "municipalityが空では登録できない" do
        @form.municipality =  ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Municipality can't be blank")
      end

      it "street_addressが空では登録できない" do
        @form.street_address = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Street address can't be blank")
      end

      it "telephone_numberが空では登録できない" do
        @form.telephone_number = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Telephone number can't be blank")
      end

      it "post_codeが「3桁ー4桁」の形式でないと登録できない" do
        @form.post_code = '1231234'
        @form.valid?
        expect(@form.errors.full_messages).to include("Post code input correctly")
      end

      it "telephone_numberが9桁以下では登録できない" do
        @form.telephone_number = '090123456'
        @form.valid?
        expect(@form.errors.full_messages).to include("Telephone number is too short (minimum is 10 characters)")
      end

      it "telephoe_numberが12桁以上では登録できない" do
        @form.telephone_number = '090123456789'
        @form.valid?
        expect(@form.errors.full_messages).to include("Telephone number is too long (maximum is 11 characters)")
      end

      it "telephone_numberに半角数字以外を含むと登録できない" do
        @form.telephone_number = '090-1234-5678'
        @form.valid?
        expect(@form.errors.full_messages).to include("Telephone number input only number")
      end

      it "tokenが空では登録できない" do
        @form.token = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Token can't be blank")
      end

      it "user_idが空では登録できない" do
        @form.user_id = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("User can't be blank")
      end

      it "item_idが空では登録できない" do
        @form.item_id = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
