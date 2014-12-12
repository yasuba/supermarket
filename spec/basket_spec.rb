require 'basket'
require 'item'

describe Basket do

  let(:basket) {Basket.new}
  let(:item) {Item.new(['Apple', 5])}
  let(:item2) {Item.new(['Banana', 4])}
  let(:item3) {Item.new(['Banana', 4])}
  let(:bogof) {Discount.new('BOGOF', 0)}
  let(:bulk_buy) {Discount.new('BULK', 0)}
  let(:item4) {Item.new(['Apple', 5])}
  let(:item5) {Item.new(['Apple', 5])}
  let(:basket_with_item) {Basket.new(item)}

  it 'should start off being empty, containing no items' do
    expect(basket.item_count).to eq(0)
  end

  it 'should accept items' do
    expect(basket_with_item.item_count).to eq(1)
  end

  it 'once item is accepted, it should no longer be for sale' do
    basket.accept(item)
    expect(item.for_sale?).to eq false
  end

  it 'cannot accept the same item twice' do
    basket.accept(item)
    expect{basket.accept(item)}.to raise_error
  end

  it 'should be able to list its items' do
    expect(basket_with_item.items).to eq [item]
  end

  it 'should be able to remove items' do
    basket_with_item.remove(item)
    expect(basket_with_item.item_count).to eq(0)
  end

  it 'should remove the specified item from basket' do
    basket_with_item.accept(item2)
    basket_with_item.remove(item2)
  end

  it 'once the item is removed, it should be for sale again' do
    basket.accept(item)
    basket.remove(item)
    expect(item.for_sale?).to eq true
  end

  it 'should be able to list a count of various items in basket' do
    basket_with_item.accept(item2)
    basket_with_item.accept(item3)
    expect(basket_with_item.total_items).to eq({apple: 1, banana: 2})
  end

  it 'should know the price of items' do
    basket.accept(item2)
    expect(basket.total_price).to eq 4
  end

  it 'should be able to add up the prices of items' do
    basket.accept(item2)
    basket.accept(item3)
    expect(basket.total_price).to eq 8
  end

  it 'should be able to apply a half-price discount voucher' do
    basket.accept(item2)
    basket.accept(item3)
    basket.accept(bogof)
    expect(basket.final_price).to eq 4
  end

  it 'should be able to apply a money-off discount voucher when bulk-buying' do
    basket.accept(item)
    basket.accept(item4)
    basket.accept(item5)
    basket.accept(bulk_buy)
    expect(basket.final_price).to eq 13.5
  end




end