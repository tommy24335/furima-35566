require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品の購入ができる時' do
    it '全ての値が正しく入力されていれば購入できる' do
      expect(@purchase_address).to be_valid
    end
    it 'building_nameは空でも保存できる' do
      @purchase_address.building_name = ''
      expect(@purchase_address).to be_valid
    end
  end

  describe '商品が購入できない時' do
    it 'tokenがないと保存できない' do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Token can't be blank"
    end
    it '郵便番号が空と保存できない' do
      @purchase_address.postal_code = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Postal code can't be blank"
    end
    it '郵便番号にハイフンがないと保存できない' do
      @purchase_address.postal_code = '1234567'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include 'Postal code is invalid. Include hyphen(-)'
    end
    it '都道府県が空だと保存できない' do
      @purchase_address.prefecture_id = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Prefecture can't be blank"
    end
    it '都道府県についてidに0が選択されている場合は保存できない' do
      @purchase_address.prefecture_id = 0
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include 'Prefecture must be other than 0'
    end
    it '市区町村が空では保存できない' do
      @purchase_address.city = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "City can't be blank"
    end
    it '番地が空では保存できない' do
      @purchase_address.address = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Address can't be blank"
    end
    it '電話番号が空では保存できない' do
      @purchase_address.phone_number = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Phone number can't be blank"
    end
    it '電話番号が11桁を超えると保存できない' do
      @purchase_address.phone_number = '080123456789'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include 'Phone number Input only number'
    end
    it '電話番号が半角英数字混合では保存できない' do
      @purchase_address.phone_number = '0801234abcd'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include 'Phone number Input only number'
    end
    it '電話番号が全角では保存できない' do
      @purchase_address.phone_number = '０８０１２３４５６７８'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include 'Phone number Input only number'
    end
  end
end
