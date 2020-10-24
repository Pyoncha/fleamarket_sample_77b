class ItemsController < ApplicationController
  require "payjp"
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_parents, only: [:new, :create, :edit, :update]
  before_action :set_edit_category, only: [:edit, :update]

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

  def edit
  end

  def update
    if @item.user_id == current_user.id
      if @item.valid? && @item.update(item_params)
        redirect_to item_path(@item.id), notice: '商品情報を更新しました'
      else
        render :edit
      end
    else
      flash.now[:alert] = 'ログインし直して下さい'
      redirect_to root_path
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path, notice: '削除しました'
    else
      render :show
    end
  end
  
  
  def purchase
    @item = Item.find(params[:item_id])
    @shipping_charge = @item.shipping_charge.defrayer
    card = CreditCard.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    @item = Item.find(params[:item_id])
    card = CreditCard.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
    Payjp::Charge.create(
      :amount => @item.price,
      :customer => card.customer_id,
      :currency => 'jpy',
    )
    buyer = Item.find(params[:item_id]).update(buyer_id: current_user.id)
    redirect_to root_path, notice: '購入処理が完了しました'
    session[:item_id] = nil
  end

  def category_search
    #ajax通信
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
    params.require(:item).permit(:name, :price, :describe, :category_id, :brand, :buyer_id, :condition_id, :shipping_charge_id, :prefecture_id, :delivery_date_id, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_edit_category
    # 該当商品の子・孫カテゴリーを変数へ代入
    grandchild = @item.category
    child = grandchild.parent
    # 親カテゴリーのnameとidを配列代入
    @parent_array = []
    @parent_array << @item.category.parent.parent.name
    @parent_array << @item.category.parent.parent.id
    # 子カテゴリーを全てインスタンス変数へ代入
    @category_children_array = Category.where(ancestry: child.ancestry)
    # 子カテゴリーのnameとidを配列代入
    @child_array = []
    @child_array << child.name
    @child_array << child.id
    # 孫カテゴリーを全てインスタンス変数へ代入
    @category_grandchildren_array = Category.where(ancestry: grandchild.ancestry) 
    # 孫カテゴリーのnameとidを配列代入
    @grandchild_array = []
    @grandchild_array << grandchild.name
    @grandchild_array << grandchild.id
  end
  
end
