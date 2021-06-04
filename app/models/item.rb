class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :sipping_cost
  belongs_to_active_hash :sipping_day

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    with_options numericality: { other_than: 0 } do
      validates :sipping_cost_id
      validates :sipping_day_id
      validates :prefecture_id
      validates :category_id
      validates :item_status_id
    end
    validates :price, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' },
              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: ' is out of setting range' }
  end
end
