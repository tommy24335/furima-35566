require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe 'ユーザー管理機能' do
   context '新規登録ができる時' do
     it 'nicknameが入力されていれば登録できる' do
      @user.nickname = 'tommy'
      expect(@user).to be_valid
     end
     it 'passwordが６文字以上半角英数字混合であれば登録できる' do
      @user.password = '000aaa'
      @user.password_confirmation = '000aaa'
      expect(@user).to be_valid
     end
     it 'famiry_nameが全角文字であれば登録出来る' do  
      @user.famiry_name = '冨永'
      expect(@user).to be_valid
     end
     it 'last_nameが全角文字であれば登録できる' do  
      @user.famiry_name = '遼太'
      expect(@user).to be_valid
     end
     it 'famiry_name_kanaが全角カナであれば登録できる' do
      @user.famiry_name_kana = 'トミナガ'
      expect(@user).to be_valid
     end
     it 'last_name_kanaが全角カナであれば登録できる' do
      @user.last_name_kana = 'リョウタ'
      expect(@user).to be_valid
     end
     it '生年月日が入力されていれば登録できる' do
      @user.birth_day = '1996-02-05'
      expect(@user).to be_valid
     end
   end
  

   context '新規登録ができない時' do
    it 'nicknameが空では登録できない' do  
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'emailが重複すると登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors[:email]).to include "has already been taken"
    end
    it 'emailに@が含まれていないと登録できない' do
      @user.email = 'test.example'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
    it  'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it "パスワードと確認が一致していないと登録できない" do
      @user.password = '000aaa'
      @user.password_confirmation = '000aab'
      @user.valid?
      expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
    end
    it 'passwordが５文字以下であれば登録できない' do
      @user.password = '000aa'
      @user.password_confirmation = '000aa'
      @user.valid?
      expect(@user.errors[:password]).to include "is too short (minimum is 6 characters)"
    end
    it 'passwordは英数字混合でないと登録できない' do
      @user.password = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid. Include both letters and numbers"
    end
    it 'famiry_nameが全角文字でなければ登録できない' do
      @user.famiry_name = 'tominaga'
      @user.valid?
      expect(@user.errors.full_messages).to include "Famiry name is invalid. Input full-width characters"
    end
    it 'last_nameが全角文字でなければ登録できない' do
      @user.last_name = 'ryota'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name is invalid. Input full-width characters"
    end
    it 'famiry_name_kanaが全角カナでなければ登録できない' do
      @user.famiry_name_kana = 'tominaga'
      @user.valid?
      expect(@user.errors.full_messages).to include "Famiry name kana is invalid. Input full-width katakana characters"
    end
    it 'last_name_kanaが全角カナでなければ登録できない' do
      @user.last_name_kana = 'tominaga'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana is invalid. Input full-width katakana characters"
    end
    it '生年月日が入力されていなければ登録できない' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth day can't be blank"
     end
  end
 end
end
