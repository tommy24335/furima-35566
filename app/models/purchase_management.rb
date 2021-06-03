class PurchaseManagement < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :sipping_address
end
