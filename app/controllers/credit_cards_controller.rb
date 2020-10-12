class CreditCardsController < ApplicationController
  require "payjp"

  def index
    card = CreditCard.where(user_id: current_user.id)
    @item_id = session[:item_id].values.first
    redirect_to credit_card_path(id: current_user) if card.exists?
  end

  def new
    card = CreditCard.where(user_id: current_user.id)
  end

  def create
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
    if params['payjp-token'].blank?
      render :new
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )
      @card = CreditCard.new(customer_id: customer.id, card_id: customer.default_card, user_id: current_user.id)
      if @card.save
        redirect_to credit_card_path(id: current_user)
      else
        render :new
      end
    end
  end

  def show
    card = CreditCard.where(user_id: current_user.id).first
    if card.blank?
      redirect_to new_credit_card_path
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
      @card_brand = @default_card_information.brand
    end
    @item_id = session[:item_id].values.first
  end

  def destroy
    card = CreditCard.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
    redirect_to credit_cards_path
  end
end
