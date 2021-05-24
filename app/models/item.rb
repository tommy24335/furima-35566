class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :item_status

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :sipping_cost

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :sipping_day



 with_options presence: true do
  validates :image
  validates :name
  validates :description
  validates :sipping_cost_id, numericality: { other_than: 0 } 
  validates :sipping_day_id, numericality: { other_than: 0 } 
  validates :prefecture_id, numericality: { other_than: 0 } 
  validates :category_id, numericality: { other_than: 0 } 
  validates :item_status_id, numericality: { other_than: 0 } 
  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' }
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: ' is out of setting range'}
 end
end
