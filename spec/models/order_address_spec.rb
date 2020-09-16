require 'rails_helper'

RSpec.describe OrderAddress, type: :model do

  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品購入機能' do
    context '商品が購入できない時' do
      it 'クレジットカード情報は必須であること' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token of credit card is invalid")
      end
    
      it '配送先の情報として、都道府県が必須であること' do
        @order_address.prefecture_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture Select")
      end
    
      it '配送先の情報として、市区町村が必須であること' do
        @order_address.address_line = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address line can't be blank")
      end
    
      it '配送先の情報として、番地が必須であること' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
    
      it '配送先の情報として、郵便番号が必須であること' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
    
      it '郵便番号は平仮名では登録できないこと' do
        @order_address.postal_code = "あああ-ああああ"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end
    
      it '郵便番号はカタカナでは登録できないこと' do
        @order_address.postal_code = "アアア-アアアア"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end
    
      it '郵便番号は漢字では登録できないこと' do
        @order_address.postal_code = "阿阿阿-阿阿阿阿"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end
  
      it '郵便番号にはハイフンが必要であること' do
        @order_address.postal_code = "1700001"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end
  
      it '郵便番号は"123-4567"のような形でないと登録できないこと' do
        @order_address.postal_code = "17-00001"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end
  
      it '配送先の情報として、電話番号が必須であること' do
        @order_address.phone = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone can't be blank")
      end
  
      it '電話番号にはハイフンが不要であること' do
        @order_address.phone = "090-9999-9999"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid")
      end
  
      it '電話番号は11桁以内であること' do
        @order_address.phone = "090123456789"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid")
      end
  
      it '電話番号には平仮名では登録できないこと' do
        @order_address.phone = "あああああああ"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid")
      end
      
      it '電話番号にはカタカナでは登録できないこと' do
        @order_address.phone = "アアアアアアア"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid")
      end
  
      it '電話番号には漢字では登録できないこと' do
        @order_address.phone = "阿阿阿阿阿阿阿"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid")
      end
    end
  
    context '商品が購入できる時' do
  
      it '建物名以外の全ての情報が正しく入力されていれば商品出品が完了する' do
        expect(@order_address).to be_valid
      end
    end

  end
end