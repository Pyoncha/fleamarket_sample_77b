class ItemsController < ApplicationController
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

  def purchase
    # 商品購入サーバーサイド作成時に本実装（現在は仮置き）
    @item = Item.find(1)
    @shipping_charge = @items.shipping_charge.defrayer
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :describe, :category, :brand, :buyer_id, :condition_id, :shipping_charge_id, :prefecture_id, :delivery_date_id, images_attributes: [:image])
  end

end
