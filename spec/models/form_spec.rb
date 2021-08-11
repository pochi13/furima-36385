require 'rails_helper'

RSpec.describe Form, type: :model do
  before do
    @form = FactoryBot.build(:form)
  end


  describe '#create' do

    context '内容に問題がある場合' do


      it '郵便番号が必須であること' do
        @form.code = ''
        @form.valid?
        
        expect(@form.errors.full_messages).to include("Code can't be blank")
      end

      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @form.code = 1234567
        @form.valid?
        
        expect(@form.errors.full_messages).to include("Code is invalid")
      end

      it '都道府県が必須であること' do
        @form.delivery_area_id = ''
        @form.valid?
       
        expect(@form.errors.full_messages).to include("Delivery area can't be blank")
      end

      it '市区町村が必須であること' do
        @form.municipality = ''
        @form.valid?
        
        expect(@form.errors.full_messages).to include("Municipality can't be blank")
      end

      it '番地が必須であること' do
        @form.address = ''
        @form.valid?
        
        expect(@form.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が必須であること' do
        @form.number = ''
        @form.valid?
        
        expect(@form.errors.full_messages).to include("Number can't be blank")
      end

      it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと' do
        @form.number = 123456789
        @form.valid?
        expect(@form.errors.full_messages).to include("Number is invalid")
      end

      it 'user情報が必須なこと' do
        @form.user_id = ''
        @form.valid?
        
        expect(@form.errors.full_messages).to include("User can't be blank")
      end

      it 'item情報が必須なこと' do
        @form.item_id = ''
        @form.valid?

        expect(@form.errors.full_messages).to include("Item can't be blank")
      end

      it "tokenが空では登録できないこと" do
        @form.token = nil
        @form.valid?
       
        expect(@form.errors.full_messages).to include("Token can't be blank")
      end
    end
     
    context '内容に問題ない場合' do
      it '全て正常' do
        expect(@form).to be_valid
      end

      it "priceとtokenがあれば保存ができること" do
        expect(@form).to be_valid
        end
       end
      end
 end

