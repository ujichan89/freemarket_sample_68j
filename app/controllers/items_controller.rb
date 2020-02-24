class ItemsController < ApplicationController
  def index
    @lankc = Item.group(:category_id).order('count_category_id DESC').count(:category_id)
    lac    = @lankc.first
    category = lac[0]
    @cates = Item.where(sale: 0).where(category_id: category).first(3)
    @piccs = Image.where(item_id: @cates).distinct

    @lankb = Item.group(:brand_id).order('count_brand_id DESC').count(:brand_id)
    lab    = @lankb.first
    brand  = lab[0]
    @bras  = Item.where(sale: 0).where(brand_id: brand).first(3)
    @picbs = Image.where(item_id: @bras).distinct
  end

  def new
 
  end

  def show

  end
end
