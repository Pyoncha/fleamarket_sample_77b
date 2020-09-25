class ItemsController < ApplicationController

  before_action :set_item, only: [:show]
  before_action :set_parents, only: [:new, :create]

  def index
    @items = Item.includes(:images).order('created_at DESC').limit(5)
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '出品完了しました'
    else
      flash.now[:alert] = '未記入の必須項目もしくは条件を満たしていない項目があります'
      render :new
    end
  end

  def show
  end

  def purchase
    # 商品購入サーバーサイド作成時に本実装（現在は仮置き）
    @item = Item.find(1)
    @shipping_charge = @items.shipping_charge.defrayer
  end

  def category_search
    #ajax通信を開始
    respond_to do |format|
      format.html
      format.json do
        if params[:parent_id]
          #子カテゴリーを探して変数@childrensに代入
          @childrens = Category.find(params[:parent_id]).children
        elsif params[:children_id]
          #孫カテゴリーを探して変数@grandchildsに代入
          @grandchilds = Category.find(params[:children_id]).children
        end
      end
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :describe, :category_id, :brand, :buyer_id, :condition_id, :shipping_charge_id, :prefecture_id, :delivery_date_id, images_attributes: [:image])
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
