class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :destroy, :update]

  def index
    @items = Item.all
    lac    = Item.group(:category_id).order('count_category_id DESC').count(:category_id).first
    category = lac[0]
    @cates = Item.order(created_at: :desc).where(sale: 0).where(category_id: category).first(3)
    # @cates = Item.order(created_at: :desc).where(sale: 0).first(3)

    lab    = Item.group(:brand_id).order('count_brand_id DESC').count(:brand_id).first
    brand  = lab[0]
    @bras  = Item.order(created_at: :desc).where(sale: 0).where(brand_id: brand).first(3)
    # @bras  = Item.order(created_at: :desc).where(sale: 0).first(3)


  end

  def new
    @item = Item.new
    @parents = Category.where(ancestry: nil)
    @item.build_brand
    @item.images.new
  end
 
  def create
    @item = Item.new(item_params)
    @item.sale =  0
    if @item.save
      redirect_to root_path, notice: '出品できました'
    else
      flash.now[:alert] = 'ちゃんと書いてください'
      render :new
    end
  end  

  def show
    @user = @item.user
    @category = @item.category
    @brand = @item.brand
    @area = @item.area
    @images = @item.images
    @item = Item.find(params[:id])
  end

  def search
    if params[:l_cat]
      @m_cat = Category.find(params[:l_cat]).children
    elsif params[:m_cat]
      @s_cat = Category.find(params[:m_cat]).children
    end

    respond_to do |format|
      format.html
      format.json
    end
  end

  def edit
    @parents = Category.where(ancestry: nil)
    @ctgrChild = @item.category.parent.siblings
    @ctgrGrandchild = @item.category.siblings
    @item.build_brand
    
  end

  def update
   item = Item.find(params[:id])
   item.update(item_params)
   #  each do で並べた画像が image
   # 新しくinputに追加された画像が image_attributes
   # この二つがない時はupdateしない
   if params[:item].keys.include?("image") || params[:item].keys.include?("images_attributes") 
     if @item.valid?
       if params[:item].keys.include?("image") 
       # dbにある画像がedit画面で一部削除してるか確認
         update_images_ids = params[:item][:image].values #投稿済み画像 
         before_images_ids = @item.images.ids
         #  商品に紐づく投稿済み画像が、投稿済みにない場合は削除する
         # @product.images.ids.each doで、一つずつimageハッシュにあるか確認。なければdestroy
         before_images_ids.each do |before_img_id|
           Image.find(before_img_id).destroy unless update_images_ids.include?("#{before_img_id}") 

         end
       else
         # imageハッシュがない = 投稿済みの画像をすべてedit画面で消しているので、商品に紐づく投稿済み画像を削除する。
         # @product.images.destroy = nil と削除されないので、each do で一つずつ削除する
         before_images_ids.each do |before_img_id|
           Image.find(before_img_id).destroy 
         end
       end
       @item.update(update_params)
       # @size = @item.category[1].sizes[0]
       # @item.update(size: nil) unless @size
       redirect_to item_path(@item), notice: "商品を更新しました"
     else
       render 'edit'
     end
   else
     redirect_back(fallback_location: root_path,flash: {success: '画像がありません'})
   end
 end  

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def update_params
    params.require(:item).permit(:name, :price, :status, :description, :charge, :area, :day, :category_id, brand_attributes: [:id, :name], images_attributes: [:picture, :id]).merge(user_id: current_user.id)
  end
  
  def item_params
    params.require(:item).permit(:name, :price, :status, :description, :charge, :area, :day, :category_id, brand_attributes: [:id, :name], images_attributes: [:picture]).merge(user_id: current_user.id)
  end
end