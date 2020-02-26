require 'rails_helper'

describe Image do
  describe '#create' do
    # 1 pictureが1枚以上あれば登録できること
    it "is valid with a image that has more than 1" do
      image = build(:image, picutre: "sample.jpg")
      image.valid?
      expect(image).to be_valid
    end
  end
end