class Form 
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality, :street_address, :building_name, :telephone_number, :user_id, :item_id
  
  validates :post_code, :prefecture_id, :municipality, :street_address, :telephone_number, presence: true
  validates :prefecture_id, numericality: { other_than: 1 , message: "select" }
  validates :post_code, format:{with:/\A\d{3}-\d{4}\z/, message: "input correctly" }
  validates :telephone_number, format:{ with: /\A\d{10,11}\z/, message: "input only number" } 

  def save
    record = Record.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, street_address: street_address, building_name: building_name, telephone_number: telephone_number, record_id: record.id)
  end
end
