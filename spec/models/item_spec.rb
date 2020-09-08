require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.img = fixture_file_upload('public/images/test_img.jpg')
  end

  describe '商品出品機能' do
    it '画像は1枚必須であること' do
      @item.img = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Img can't be blank")
    end
    it '商品名が必須であること' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明が必須であること' do
      @item.detail = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Detail can't be blank")
    end
    it 'カテゴリーの情報が必須であること' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Category Select')
    end
    it '商品の状態についての情報が必須であること' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Status Select')
    end
    it '配送料の負担についての情報が必須であること' do
      @item.delivery_fee_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery fee Select')
    end
    it '発送元の地域についての情報が必須であること' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture Select')
    end
    it '発送までの日数についての情報が必須であること' do
      @item.shipping_date_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping date Select')
    end
    it '価格についての情報が必須であること' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
    it '価格の範囲が、¥300未満であると登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
    it '価格の範囲が、¥10,000,000以上であると登録できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
    it '販売価格は半角数字のみ入力可能であること' do
      @item.price = 'あああ'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
  end
end
