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
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    if @item.save
      redirect_to action: "index"
    else
      render "new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :status, :description, :charge, :area, :day, :sale, images_attributes: [:picture])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

  def destroy
    item = Item.find(params[:id])
    item.destory
  end
end