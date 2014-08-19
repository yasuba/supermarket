require 'basket'
require 'item'

describe Basket do

	let(:basket) {Basket.new}
	let(:item) {Item.new(:name => 'Apple', :price => 5)}
	let(:item2) {Item.new(:name => 'Banana', :price => 4)}
	let(:item3) {Item.new(:name => 'Banana', :price => 4)}
	
	it 'should start off being empty, containing no items' do 
		expect(basket.item_count).to eq(0)
	end 

	it 'should accept items' do
		basket.accept(item)
		expect(basket.item_count).to eq(1)
	end

	it 'should be able to list its items' do
		basket.accept(item)
		expect(basket.items).to eq [item]
	end

	it 'should be able to remove items' do
		basket.accept(item)
		basket.remove(item)
		expect(basket.item_count).to eq(0)
	end

	it 'should remove the specified item from basket' do
		basket.accept(item2)
		basket.accept(item)
		basket.remove(item2)
		expect(basket.items).to eq [item]
	end

	it 'should be able to list a count of various items in basket' do
		basket.accept(item2)
		basket.accept(item)
		basket.accept(item3)
		expect(basket.list_items).to eq ['Banana', 'Apple', 'Banana']
	end

end