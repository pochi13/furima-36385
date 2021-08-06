require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end
  describe '#create' do
    context '内容に問題がある場合' do
      it 'nicknameが空では登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'メールアドレスが一意性であること(重複したemailが存在する場合登録できないこと)' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスは、@を含む必要があること' do
        @user.email = 'aa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードは、6文字以上での入力が必須であること' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'パスワードは、半角英数字混合での入力が必須であること' do
        @user.password = '12345あ'
        @user.password_confirmation = '12345a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

  
    before do
      @user = FactoryBot.build(:user)
    end
  describe '#create' do
  context '内容に問題がある場合' do
    it 'nicknameが空では登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'メールアドレスが一意性であること(重複したemailが存在する場合登録できないこと)' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'メールアドレスは、@を含む必要があること' do
      @user.email = 'aa.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'パスワードは、6文字以上での入力が必須であること' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      
    end

    it 'パスワードは、半角英数字混合での入力が必須であること' do
      @user.password = '12345あ'
      @user.password_confirmation = '12345a'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end


      it 'passwordが半角英字のみの場合は登録できない' do
        @user.password = 'aiueoあ'
        @user.password_confirmation = 'aiueokあ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end


      it 'passwordが全角の場合は登録できない' do
        @user.password = 'アイウエオカ'
        @user.password_confirmation = 'アイウエオカ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?

        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'お名前(全角)は、名字と名前がそれぞれ必須であること' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end


          it 'passwordが全角の場合は登録できない' do
            @user.password = 'アイウエオカ'
            @user.password_confirmation = 'アイウエオカ'
            @user.valid?
            expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
          end


    it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  


    it 'お名前(全角)は、名字と名前がそれぞれ必須であること' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end


      it 'お名前(全角)は、名字と名前がそれぞれ必須であること' do
        @user.first_name = ''
        @user.valid?

        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.first_name_kana = 'aiueo'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end

        expect(@user.errors.full_messages).to include("First name is invalid")
      end

    it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.first_name_kana = 'aiueo'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end


      it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.last_name_kana = 'aiueo'
        @user.valid?

        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end

      it 'お名前カナ(全角)は、名字と名前がそれぞれ必須であること' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end

        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

    it 'お名前カナ(全角)は、名字と名前がそれぞれ必須であること' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end


      it 'お名前カナ(全角)は、名字と名前がそれぞれ必須であること' do
        @user.first_name_kana = ''
        @user.valid?

        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end

      it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
        @user.last_name_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end

      it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
        @user.first_name_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end

      it '生年月日が必須であること' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end

        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

    it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
      @user.last_name_kana = 'あいうえお'
      @user.valid?
      binding.pry
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end

    it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
      @user.first_name_kana = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it '生年月日が必須であること' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end


    context '内容に問題ない場合' do
      it '全て正常' do
        expect(@user).to be_valid
      end
    end
  end

end

end

