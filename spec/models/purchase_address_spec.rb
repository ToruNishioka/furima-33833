require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user_id = FactoryBot.create
    item_id = FactoryBot.create
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user_id, item_id: item_id)
  end

  describe '商品購入機能の実装' do
    context '商品購入がうまくいくとき' do
      it '正しい値が全て記述されている場合購入できる' do
        expect(@purchase_address).to be_valid
      end
      it '建物番号が空の場合でも購入できる' do
        @purchase_address.building_name
        expect(@purchase_address).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it '郵便番号がないと購入できない' do
        @purchase_address.postal_code = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Postal code can't be blank"
      end
      it '都道府県がないと購入できない' do
        @purchase_address.area_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include 'Area must be other than 1'
      end
      it '市区町村がないと購入できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "City can't be blank"
      end
      it '番地がないと購入できない' do
        @purchase_address.house_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "House number can't be blank"
      end
      it '電話番号がないと購入できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Phone number can't be blank"
      end
      it '郵便番号は３桁数字とハイフンと４桁数字でないと購入できない' do
        @purchase_address.postal_code = '7430071'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include 'Postal code is invalid'
      end
      it '郵便番号は半角数字でないと購入できない' do
        @purchase_address.postal_code = '７４３-００７１'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include 'Postal code is invalid'
      end
      it '電話番号は11桁以内でないと購入できない' do
        @purchase_address.phone_number = 0o12000000000
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include 'Phone number is invalid'
      end
      it '電話番号に英数混合の値が入力された場合購入できない' do
        @purchase_address.phone_number = '0801234567a'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include 'Phone number is invalid'
      end
      it '電話番号は半角数字でないと購入できない' do
        @purchase_address.phone_number = '０８０１２３４５６７８'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include 'Phone number is invalid'
      end
      it 'user_idがnilだった場合購入できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "User can't be blank"
      end
      it 'item_idがnilだった場合購入できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Item can't be blank"
      end
      it 'tokenが空では登録できないこと' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
