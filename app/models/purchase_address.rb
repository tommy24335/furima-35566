class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :address, :city, :building_name, :prefecture_id, :postal_code, :phone_number, :user_id, :item_id,
                :purchase_management_id, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :address
    validates :city
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'Input only number' }
  end

  def save
    purchase_management = PurchaseManagement.create(user_id: user_id, item_id: item_id)
    SippingAddress.create(address: address, city: city, building_name: building_name, prefecture_id: prefecture_id,
                          postal_code: postal_code, phone_number: phone_number, purchase_management_id: purchase_management.id)
  end
end
