require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '購入情報の保存' do
    before do
      @order = FactoryBot.build(:order)
    end
    context '商品が購入できるとき' do
      it '全て正しく入力されている場合' do
        expect(@order.valid?).to eq true
      end
    end
    context '商品が購入できないとき' do
      it '郵便番号が必須であること' do
        @order.post_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Post number can't be blank")
      end
      it '郵便番号は、ハイフンが必須であること(例:123-4567)' do
        @order.post_number = '123-4567'
        expect(@order).to be_valid
      end
      it '郵便番号は、ハイフンなしでは保存できないこと' do
        @order.post_number = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Post number is invalid')
      end
      it '都道府県選択が必須であること' do
        @order.area_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Area can't be blank")
      end
      it '市区町村名が必須であること' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it '番地が必須であること' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が必須であること' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は、ハイフン無しの11桁以内が必須であること' do
        @order.phone_number = '09012345678'
        expect(@order).to be_valid
      end
      it '電話番号は、ハイフン無しの12桁では保存できないこと' do
        @order.phone_number = '090123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      it 'tokenが空では登録できないこと' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
