class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :number_of_day
  belongs_to :prefecture
  has_one :record

  validates :name, :description, :price, :image, presence: true
  validates :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :number_of_day_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
end
