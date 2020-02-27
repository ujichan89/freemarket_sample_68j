require 'rails_helper'

describe '#create' do
  # 1 genre
  it "is valid with a genre that has more than 1" do
    category = build(:category, genre: 00)
    category.valid?
    expect(category).to be_valid
  end
end