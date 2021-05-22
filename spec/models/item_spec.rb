require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能の実装' do
    context '商品出品がうまくいくとき' do
      it '商品画像を1枚つけると出品できる' do
        expect(@item).to be_valid
      end
      it '商品名をつけると出品できる' do
        @item.title = (:item)
        expect(@item).to be_valid
      end
      it '商品の説明があると出品できる' do
        @item.description = (:item)
        expect(@item).to be_valid
      end
      it 'カテゴリーの情報があると出品できる' do
        @item.category_id = 2
        expect(@item).to be_valid
      end
      it '商品の状態についての情報があると出品できる' do
        @item.status_id = 2
        expect(@item).to be_valid
      end
      it '配送料の負担についての情報があると出品できる' do
        @item.delivery_charge_id = 2
        expect(@item).to be_valid
      end
      it '発送元の地域についての情報があると出品できる' do
        @item.area_id = 2
        expect(@item).to be_valid
      end
      it '発送までの日数についての情報があると出品できる' do
        @item.days_to_ship_id = 2
        expect(@item).to be_valid
      end
      it '販売価格についての情報が¥300~¥9,999,999の間であれば出品できる' do
        @item.price = 500
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it '商品画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '商品名がないと出品できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Title can't be blank"
      end
      it '商品の説明がないと出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      it 'カテゴリーが未選択であると出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it '商品の状態について未選択であると出品できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it '配送料の負担について未選択であると出品できない' do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery charge can't be blank"
      end
      it '発送元の地域について未選択であると出品できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Area can't be blank"
      end
      it '発送までの日数について未選択であると出品できない' do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Days to ship can't be blank"
      end
      it '販売価格の情報がないと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '販売価格が全角数字だと出品できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not included in the list'
      end
      it '販売価格が¥300未満では出品できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not included in the list'
      end
      it '販売価格が¥9,999,999以上だと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not included in the list'
      end
    end
  end
end
