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
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    # 3. emailが空では登録できないこと
    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    # 4. passwordが空では登録できないこと
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    # 5. passwordが存在してもpassword_confirmationが空では登録できないこと
    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    # 6. family_nameが空では登録できないこと
    it "is invalid without a family_name" do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください")
    end

      # 7. first_nameが空では登録できないこと
      it "is invalid without a first_name" do
        user = build(:user, first_name: nil)
        user.valid?
        expect(user.errors[:first_name]).to include("を入力してください")
      end

      # 8. family_furiganaが空では登録できないこと
      it "is invalid without a family_furigana" do
        user = build(:user, family_furigana: nil)
        user.valid?
        expect(user.errors[:family_furigana]).to include("を入力してください")
      end

      # 9. first_furiganaが空では登録できないこと
      it "is invalid without a first_furigana" do
        user = build(:user, first_furigana: nil)
        user.valid?
        expect(user.errors[:first_furigana]).to include("を入力してください")
      end

      # 10. birthday_yearが空では登録できないこと
      it "is invalid without a birthday_year" do
        user = build(:user, birthday_year: nil)
        user.valid?
        expect(user.errors[:birthday_year]).to include("を入力してください")
      end


      # 11. birthday_monthが空では登録できないこと
      it "is invalid without a birthday_year" do
        user = build(:user, birthday_month: nil)
        user.valid?
        expect(user.errors[:birthday_month]).to include("を入力してください")
      end


      # 12. birthday_dayが空では登録できないこと
      it "is invalid without a birthday_year" do
        user = build(:user, birthday_day: nil)
        user.valid?
        expect(user.errors[:birthday_day]).to include("を入力してください")
      end
  
    # 13. nicknameが6文字以下では登録できること
    it "is valid with a nickname that has less than 6 characters " do
      user = build(:user, nickname: "aaaaaa")
      expect(user).to be_valid
    end

    # 14. 重複したemailが存在する場合登録できないこと
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    # 15. passwordが7文字以上であれば登録できること
    it "is valid with a password that has more than 7 characters " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user).to be_valid
    end
  end
end


#---------------------------------------------------------------------------------------


describe Address do
  describe '#create' do
    # 1. family_name, first_name, family_furigana, first_furigana, number, prefecture, municipality, streetが存在すれば登録できること
    it "is valid with a family_name, first_name, family_furigana, first_furigana, number, prefecture, municipality, street" do
      address = build(:address)
      expect(address).to be_valid
    end

    # 2. family_nameが空では登録できないこと
    it "is invalid without a family_name," do
      address = build(:address, family_name: nil)
      address.valid?
      expect(address.errors[:family_name]).to include("を入力してください")
    end

    #通らない
    # 3. family_furiganaが空では登録できないこと
    it "is invalid without a family_furigana" do
      address = build(:address, family_furigana: nil)
      address.valid?
      expect(address.errors[:family_furigana]).to include("を入力してください")
    end    

    # 4. first_furiganaが空では登録できないこと
    it "is invalid without a first_furigana" do
      address = build(:address, first_furigana: nil)
      address.valid?
      expect(address.errors[:first_furigana]).to include("を入力してください")
    end

    # 5. first_furiganaが空では登録できないこと
    it "is invalid without a first_furigana" do
      address = build(:address, first_furigana: nil)
      address.valid?
      expect(address.errors[:first_furigana]).to include("を入力してください")
    end

    # 6. numberが空では登録できないこと
    it "is invalid without a number" do
      address = build(:address, number: nil)
      address.valid?
      expect(address.errors[:number]).to include("を入力してください")
    end

    # 7. prefectureが空では登録できないこと
    it "is invalid without a prefecture" do
      address = build(:address, prefecture: nil)
      address.valid?
      expect(address.errors[:prefecture]).to include("を入力してください")
    end


    # 8. municipalityが空では登録できないこと
    it "is invalid without a municipality" do
      address = build(:address, municipality: nil)
      address.valid?
      expect(address.errors[:municipality]).to include("を入力してください")
    end

    # 9. streetが空では登録できないこと
    it "is invalid without a street" do
      address = build(:address, street: nil)
      address.valid?
      expect(address.errors[:street]).to include("を入力してください")
    end
  end
end