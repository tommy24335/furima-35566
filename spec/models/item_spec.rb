require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品できる時' do
    it '商品画像が一枚付いていれば出品できる' do
      expect(@item).to be_valid
    end
    it '商品名があれば出品できる' do
      @item.name = 'test'
      expect(@item).to be_valid
    end
    it '商品の説明があれば出品できる' do
      @item.name = 'testtest'
      expect(@item).to be_valid
    end
    it 'カテゴリーの情報があれば出品できる' do
      @item.category_id
      expect(@item).to be_valid
    end
    it '商品の状態についての情報があれば出品できる' do
      @item.item_status_id
      expect(@item).to be_valid
    end
    it '配送料の負担についての情報があれば出品できる' do
      @item.sipping_cost_id
      expect(@item).to be_valid
    end
    it '発送元の地域についての情報があれば出品できる' do
      @item.prefecture_id
      expect(@item).to be_valid
    end
    it '発送までの日数についての情報があれば出品できる' do
      @item.sipping_day_id
      expect(@item).to be_valid
    end
    it '販売価格についての情報があれば出品できる' do
      @item.price = 500
      expect(@item).to be_valid
    end
    it '販売価格は半角数字のみ保存できる' do
      @item.price = 400
      expect(@item).to be_valid
    end
    it '販売価格は、¥300~¥9,999,999の間のみ出品できる' do
      @item.price = 100_000
      expect(@item).to be_valid
    end
  end

  describe '出品できない時' do
    it '商品画像が一枚付いていなければ出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end
    it '商品名がなければ出品できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Name can't be blank"
    end
    it '商品の説明がなければ出品できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Description can't be blank"
    end
    it 'カテゴリーの情報がなければ出品できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end
    it 'カテゴリーについてidに0が選択されている場合は出品できない' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include 'Category must be other than 0'
    end
    it '商品の状態についての情報がなければ出品できない' do
      @item.item_status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Item status can't be blank"
    end
    it '配送料の負担についての情報がなければ出品できない' do
      @item.sipping_cost_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Sipping cost can't be blank"
    end
    it '発送料の負担についてidに0が選択されている場合は出品できない' do
      @item.sipping_cost_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include 'Sipping cost must be other than 0'
    end
    it '発送元の地域についての情報がなければ出品できない' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Prefecture can't be blank"
    end
    it '発送元の地域についてidに0が選択されている場合は出品できない' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include 'Prefecture must be other than 0'
    end
    it '発送までの日数についての情報がなければ出品できない' do
      @item.sipping_day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Sipping day can't be blank"
    end
    it '発送までの日数についてidに0が選択されている場合は出品できない' do
      @item.sipping_day_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include 'Sipping day must be other than 0'
    end
    it '販売価格についての情報がなければ出品できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end
    it '販売価格は半角数字意外では保存できない' do
      @item.price = '５００'
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price is invalid. Input half-width characters'
    end
    it '販売価格は、¥300未満では出品できない' do
      @item.price = 10
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price  is out of setting range'
    end
    it '販売価格は、¥9,999,999より大きいと出品できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price  is out of setting range'
    end
    it '商品価格が半角英数字混合では出品できない' do
      @item.price = '1a1'
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price is invalid. Input half-width characters'
    end
    it '商品価格が半角英字のみでは出品できない' do
      @item.price = 'aaa'
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price is invalid. Input half-width characters'
    end
  end
end
