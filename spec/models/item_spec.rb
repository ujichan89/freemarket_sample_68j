require 'rails_helper'

describe Item do
  describe '#create' do
    # 1. name, description, status, charge, area, day, price, picture, genreが存在すれば登録できること
    it "is valid with a name, description, status, charge, area, day, price, genre" do
      item = build(:item)
      expect(item).to be_valid
    end

    # 2. nameが空では登録できないこと
    it "is invalid without a name" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    # 3. descriptionが空では登録できないこと
    it "is invalid without a description" do
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description]).to include("を入力してください")
    end

    # 4. statusが空では登録できないこと
    it "is invalid without a status" do
      item = build(:item, status: nil)
      item.valid?
      expect(item.errors[:status]).to include("を入力してください")
    end


    # 5. chargeが空では登録できないこと
    it "is invalid without a charge" do
      item = build(:item, charge: nil)
      item.valid?
      expect(item.errors[:charge]).to include("を入力してください")
    end

    # 6. areaが空では登録できないこと
    it "is invalid without a area" do
      item = build(:item, area: nil)
      item.valid?
      expect(item.errors[:area]).to include("を入力してください")
    end

    # 7. dayが空では登録できないこと
    it "is invalid without a day" do
      item = build(:item, day: nil)
      item.valid?
      expect(item.errors[:day]).to include("を入力してください")
    end

    # 8. priceが空では登録できないこと
    it "is invalid without a price" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

  end
end