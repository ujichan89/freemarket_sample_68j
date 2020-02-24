class ItemsController < ApplicationController
  def index
    @category = Item.where(category_id: 1)
    @cates = Item.where(sale: 0).where(category_id: @category).first(3)
    @piccs = Image.where(item_id: @cates).distinct

    @brand = Item.where(brand_id: 1)
    @bras = Item.where(sale: 0).where(brand_id: @brand).first(3)
    @picbs = Image.where(item_id: @bras).distinct
  end

  def new
 
  end

  def show

  end
end
