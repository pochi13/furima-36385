require 'rails_helper'

  RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  
  describe '#create' do
    
    context '内容に問題がある場合' do
      
      it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が必須であること' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明が必須であること' do
        @item.explan = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explan can't be blank")
      end

      it 'カテゴリーの情報が必須であること' do
        @item.detail_category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail category can't be blank")
      end

      it 'カテゴリーの情報が１の時には出品できない' do
        @item.detail_category_id = 1
        @item.valid?
        
        expect(@item.errors.full_messages).to include("Detail category must be other than 1")
      end

      it '商品の状態の情報が必須であること' do
        @item.detail_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail status can't be blank")
      end

      it '商品の状態の情報が１の時には出品できない' do
        @item.detail_status_id = 1
        @item.valid?
        
        expect(@item.errors.full_messages).to include("Detail status must be other than 1")
      end

      it '配送料の負担の情報が必須であること' do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end

      it '配送料の負担の情報が１の時には出品できない' do
        @item.delivery_charge_id = 1
        @item.valid?
       
        expect(@item.errors.full_messages).to include("Delivery charge must be other than 1")
      end

      it '発送元の地域の情報が必須であること' do
        @item.delivery_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area can't be blank")
      end

      it '発送元の地域の情報が１の時には出品できない' do
        @item.delivery_area_id = 1
        @item.valid?
        
        expect(@item.errors.full_messages).to include("Delivery area must be other than 1")
      end

      it '発送の目安の情報が必須であること' do
        @item.delivery_indication_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery indication can't be blank")
      end

      it '発送元の地域の情報が１の時には出品できない' do
        @item.delivery_indication_id = 1
        @item.valid?
        
        expect(@item.errors.full_messages).to include("Delivery indication must be other than 1")
      end



      it '価格の情報が必須であること' do
        @item.price = ''
        @item.valid?
        
        expect(@item.errors.full_messages).to include("Price is invalid")
      end

      it '価格は、¥300~¥9,999,999の間のみ保存可能であること' do
        @item.price = 299
        @item.valid?
    
        expect(@item.errors.full_messages).to include( "Price is not included in the list")
      end


      it '価格は、¥300~¥9,999,999の間のみ保存可能であること' do
        @item.price = 10000000
        @item.valid?
        
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it '価格は半角数値のみ保存可能であること' do
        @item.price = 'あいうえお'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it 'user情報が空の場合は保存できない' do
        @item.user = nil
        @item.valid?
        
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end

    context '内容に問題ない場合' do
      it '全て正常' do
        expect(@item).to be_valid
      end
    end
  end
end

