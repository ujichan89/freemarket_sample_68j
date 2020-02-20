require 'rails_helper'

describe User do
  describe '#create' do
    # 1. nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること
    it "is valid with a nickname, email, password, password_confirmation, family_name, first_name, family_furigana, first_furigana, birthday_year, birthday_month, birthday_day" do
      user = build(:user)
      expect(user).to be_valid
    end

    # 2. nicknameが空では登録できないこと
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    # 3. emailが空では登録できないこと
    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # 4. passwordが空では登録できないこと
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    # 5. passwordが存在してもpassword_confirmationが空では登録できないこと
    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

birthday_month, birthday_day


    # 6. family_nameが空では登録できないこと
    it "is invalid without a family_name" do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("can't be blank")
    end

      # 7. first_nameが空では登録できないこと
      it "is invalid without a first_name" do
        user = build(:user, first_name: nil)
        user.valid?
        expect(user.errors[:first_name]).to include("can't be blank")
      end

      # 8. family_furiganaが空では登録できないこと
      it "is invalid without a family_furigana" do
        user = build(:user, family_furigana: nil)
        user.valid?
        expect(user.errors[:family_furigana]).to include("can't be blank")
      end

      # 9. first_furiganaが空では登録できないこと
      it "is invalid without a first_furigana" do
        user = build(:user, first_furigana: nil)
        user.valid?
        expect(user.errors[:first_furigana]).to include("can't be blank")
      end

      # 10. birthday_yearが空では登録できないこと
      it "is invalid without a birthday_year" do
        user = build(:user, birthday_year: nil)
        user.valid?
        expect(user.errors[:birthday_year]).to include("can't be blank")
      end


      # 11. birthday_yearが空では登録できないこと
      it "is invalid without a birthday_year" do
        user = build(:user, birthday_year: nil)
        user.valid?
        expect(user.errors[:birthday_year]).to include("can't be blank")
      end


      # 12. birthday_yearが空では登録できないこと
      it "is invalid without a birthday_year" do
        user = build(:user, birthday_year: nil)
        user.valid?
        expect(user.errors[:birthday_year]).to include("can't be blank")
      end



















    # 6. nicknameが7文字以上であれば登録できないこと
    it "is invalid with a nickname that has more than 7 characters " do
      user = build(:user, nickname: "aaaaaaaa")
      user.valid?
      expect(user.errors[:nickname]).to include("is too long (maximum is 6 characters)")
    end

    # 7. nicknameが6文字以下では登録できること
    it "is valid with a nickname that has less than 6 characters " do
      user = build(:user, nickname: "aaaaaa")
      expect(user).to be_valid
    end

    # 8. 重複したemailが存在する場合登録できないこと
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    # 9. passwordが6文字以上であれば登録できること
    it "is valid with a password that has more than 7 characters " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user).to be_valid
    end

    # 10. passwordが5文字以下であれば登録できないこと
    it "is invalid with a password that has less than 6 characters " do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end









  end
end