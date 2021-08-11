require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @adress = FactoryBot.build(:address)
  end


  describe '#create' do

    context '内容に問題がある場合' do


      it '郵便番号が必須であること' do
        @address.code = ''
        @address.valid?
        
        expect(@item.errors.full_messages).to include("")
      end

      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @address.code = 1234567
        @address.valid?
        expect(@address.errors.full_messages).to include("")
      end

      it '都道府県が必須であること' do
        @address.detail_category_id = 1
        @address.valid?
        expect(@address.errors.full_messages).to include("")
      end

      it '市区町村が必須であること' do
        @address.municipality = ''
        @address.valid?
        
        expect(@address.errors.full_messages).to include("")
      end

      it '番地が必須であること' do
        @address.address = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("")
      end

      it '電話番号が必須であること' do
        @address.number = ''
        @address.valid?
        
        expect(@address.errors.full_messages).to include("")
      end

      it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと' do
        @address.number = １２３４５６７８９
        @address.valid?
        expect(@item.errors.full_messages).to include("")
      end

     
    context '内容に問題ない場合' do
      it '全て正常' do
        expect(@address).to be_valid
      end
    end
  end
end

