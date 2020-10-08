class ItemsController < ApplicationController
  require "payjp"

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
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :describe, :category, :brand, :buyer_id, :condition_id, :shipping_charge_id, :prefecture_id, :delivery_date_id, images_attributes: [:image])
  end

end
