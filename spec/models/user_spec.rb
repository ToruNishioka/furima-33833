require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空だと登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it '同じメールアドレスは登録できない' do
      @user = FactoryBot.create(:user)
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include 'has already been taken'
    end
    it 'メールアドレスには@を含めないといけない' do
      @user.email = 'test.example'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Email is invalid'
    end
    it 'passwordが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'passwordは6文字以上の入力が必要' do
      @user.password = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
    end
    it 'passwordは半角英数字混合での入力が必要' do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors[:password]).to include 'には英字と数字の両方を含めて設定してください'
    end
    it 'passwordは確認用を含め2回入力が必要' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'passwordと確認用passwordは一致しないといけない' do
      @user.password = '0000aa'
      @user.password_confirmation = '0000bb'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'ユーザー本名は名字が必須である' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it 'ユーザー本名は名前が必須である' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'ユーザー本名は全角（漢字・ひらがな・カタカナ）での入力が必須である' do
      @user.last_name = 'hoge'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Last name には全角文字を使用してください'
    end
    it 'ユーザー本名のフリガナは、名字が必須である' do
      @user.last_name_k = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name k can't be blank"
    end
    it 'ユーザー本名のフリガナは、名前が必須である' do
      @user.first_name_k = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name k can't be blank"
    end
    it 'ユーザーの名字のフリガナは、全角（カタカナ）での入力が必須である' do
      @user.last_name_k = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Last name k には全角カタカナを使用してください'
    end
    it 'ユーザーの名前のフリガナは、全角（カタカナ）での入力が必須である' do
      @user.first_name_k = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name k には全角カタカナを使用してください'
    end
    it '生年月日が必須である' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
end
