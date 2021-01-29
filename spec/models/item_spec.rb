require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '出品新規登録' do
    context '出品登録できるとき' do
      it '販売価格は半角数字で保存可能であること' do
        @item.price = 10000
        expect(@item).to be_valid
      end
      it '価格の範囲が、¥300~¥9,999,999の間であること' do
        @item.price = 10000
        expect(@item).to be_valid
      end
    end

    context '出品登録できないとき' do
      it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必須であること' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it '商品の説明が必須であること' do
        @item.product_text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product text can't be blank")
      end
      it 'カテゴリーの情報が必須であること' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idが1の場合出品ができない' do 
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it '商品の状態についての情報が必須であること' do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end
      it 'state_idが1の場合出品ができない' do 
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('State must be other than 1')
      end
      it '配送料の負担についての情報が必須であること' do
        @item.burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden can't be blank")
      end
      it 'burden_idが1の場合出品ができない' do 
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Burden must be other than 1')
      end
      it '発送元の地域についての情報が必須であること' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it 'area_idが1の場合出品ができない' do 
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Area must be other than 1')
      end
      it '発送までの日数についての情報が必須であること' do
        @item.shiping_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shiping can't be blank")
      end
      it 'shiping_idが1の場合出品ができない' do 
        @item.shiping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shiping must be other than 1')
      end
      it '価格についての情報が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格の範囲が、¥300未満だと保存できないこと' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '価格の範囲が、¥10,000,000以上だと保存できないこと' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '販売価格は全角数字があると保存できないこと' do
        @item.price = '０００００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '販売価格は全角英字があると保存できないこと' do
        @item.price = 'ｆｆｆｆｆ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '販売価格は半角英字があると保存できないこと' do
        @item.price = 'fffff'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
    end
  end
end
