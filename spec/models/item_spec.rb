require 'rails_helper'

describe Item do
  describe '#create' do
    it "全て入力されていればOK" do
      item = create(:item)
      expect(item).to be_valid
    end
    it "nameが空ならNG" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end
    it "nameが41文字以上ならNG" do
      item = build(:item, name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      item.valid?
      expect(item.errors[:name]).to include("is too long (maximum is 40 characters)")
    end
    it "describeが空ならNG" do
      item = build(:item, describe: nil)
      item.valid?
      expect(item.errors[:describe]).to include("can't be blank")
    end
    it "describeが1001文字以上ならNG" do
      item = build(:item, describe: "a" * 1001)
      item.valid?
      expect(item.errors[:describe]).to include("is too long (maximum is 1000 characters)")
    end
    it "brandが空でもOK" do
      item = build(:item, brand: "")
      expect(item).to be_valid
    end
    it "priceが空ならNG" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end
    it "priceがinteger以外ならNG" do
      item = build(:item, price: "３００")
      item.valid?
      expect(item.errors[:price]).to include("is not a number")
    end
    it "priceが300円未満ならNG" do
      item = build(:item, price: "290")
      item.valid?
      expect(item.errors[:price]).to include("must be greater than or equal to 300")
    end
    it "priceが9999999円よりも高額ならNG" do
      item = build(:item, price: "10000000")
      item.valid?
      expect(item.errors[:price]).to include("must be less than or equal to 9999999")
    end
    it "categoryが空ならNG" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end
    it "conditionが空ならNG" do
      item = build(:item, condition_id: nil)
      item.valid?
      expect(item.errors[:condition_id]).to include("can't be blank")
    end
    it "conditionが空ならNG" do
      item = build(:item, condition_id: nil)
      item.valid?
      expect(item.errors[:condition_id]).to include("can't be blank")
    end
    it "shipping_chargeが空ならNG" do
      item = build(:item, shipping_charge_id: nil)
      item.valid?
      expect(item.errors[:shipping_charge_id]).to include("can't be blank")
    end
    it "prefectureが空ならNG" do
      item = build(:item, prefecture_id: nil)
      item.valid?
      expect(item.errors[:prefecture_id]).to include("can't be blank")
    end
    it "delivery_dateが空ならNG" do
      item = build(:item, delivery_date_id: nil)
      item.valid?
      expect(item.errors[:delivery_date_id]).to include("can't be blank")
    end
  end

  describe '#update' do
    it "全て入力されていればOK" do
      item = create(:item)
      expect(item).to be_valid
    end
    it "nameが空ならNG" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end
    it "nameが41文字以上ならNG" do
      item = build(:item, name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      item.valid?
      expect(item.errors[:name]).to include("is too long (maximum is 40 characters)")
    end
    it "describeが空ならNG" do
      item = build(:item, describe: nil)
      item.valid?
      expect(item.errors[:describe]).to include("can't be blank")
    end
    it "describeが1001文字以上ならNG" do
      item = build(:item, describe: "a" * 1001)
      item.valid?
      expect(item.errors[:describe]).to include("is too long (maximum is 1000 characters)")
    end
    it "brandが空でもOK" do
      item = build(:item, brand: "")
      expect(item).to be_valid
    end
    it "priceが空ならNG" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end
    it "priceがinteger以外ならNG" do
      item = build(:item, price: "３００")
      item.valid?
      expect(item.errors[:price]).to include("is not a number")
    end
    it "priceが300円未満ならNG" do
      item = build(:item, price: "290")
      item.valid?
      expect(item.errors[:price]).to include("must be greater than or equal to 300")
    end
    it "priceが9999999円よりも高額ならNG" do
      item = build(:item, price: "10000000")
      item.valid?
      expect(item.errors[:price]).to include("must be less than or equal to 9999999")
    end
    it "categoryが空ならNG" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end
    it "conditionが空ならNG" do
      item = build(:item, condition_id: nil)
      item.valid?
      expect(item.errors[:condition_id]).to include("can't be blank")
    end
    it "conditionが空ならNG" do
      item = build(:item, condition_id: nil)
      item.valid?
      expect(item.errors[:condition_id]).to include("can't be blank")
    end
    it "shipping_chargeが空ならNG" do
      item = build(:item, shipping_charge_id: nil)
      item.valid?
      expect(item.errors[:shipping_charge_id]).to include("can't be blank")
    end
    it "prefectureが空ならNG" do
      item = build(:item, prefecture_id: nil)
      item.valid?
      expect(item.errors[:prefecture_id]).to include("can't be blank")
    end
    it "delivery_dateが空ならNG" do
      item = build(:item, delivery_date_id: nil)
      item.valid?
      expect(item.errors[:delivery_date_id]).to include("can't be blank")
    end
  end
end
