require 'rails_helper'

describe CreditCard, type: :model do
  describe '#create' do
    it '全て入力されていればOK' do
      card = build(:credit_card)
      expect(card).to be_valid
    end

    it 'customer_idが空ならNG' do
      card = build(:credit_card, customer_id: nil)
      card.valid?
      expect(card.errors[:customer_id]).to include("can't be blank")
    end

    it 'card_idが空ならNG' do
      card = build(:credit_card, card_id: nil)
      card.valid?
      expect(card.errors[:card_id]).to include("can't be blank")
    end
  end
end
