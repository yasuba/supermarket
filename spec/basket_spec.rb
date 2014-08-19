require 'basket'
require 'item'

describe Basket do

	let(:basket) {Basket.new}
	let(:item) {Item.new(:name => 'Apple', :price => 5)}
	let(:item2) {Item.new(:name => 'Banana', :price => 4)}
	let(:item3) {Item.new(:name => 'Banana', :price => 4)}
	let(:basket_with_item) {Basket.new(item)}
	
	it 'should start off being empty, containing no items' do 
		expect(basket.item_count).to eq(0)
	end 

	it 'should accept items' do
		expect(basket_with_item.item_count).to eq(1)
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
		expect(basket_with_item.items).to eq [item]
	end

	it 'should be able to list a count of various items in basket' do
		basket_with_item.accept(item2)
		basket_with_item.accept(item3)
		expect(basket_with_item.list_items).to eq ['Apple', 'Banana', 'Banana']
	end

end