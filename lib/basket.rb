require_relative 'item'
require_relative 'discount'

class Basket

  attr_accessor :items

  def initialize(item=nil)
    @items = []
    @items << item unless item.nil?
  end

  def items
    @items ||= []
  end

  def item_count
    @items.count
  end

  def accept(item)
    raise "You've already bought this item" if @items.include?(item)
    @items << item
    unless item.is_a? Discount
      item.buy!
    end
  end

  def remove(item)
    @items.reject! { |x| x if x == item }
    item.return!
  end

  def list_items
    items.map(&:name)
  end

  def total_items
    @return_hash = {}
    items.each do |item|
      @return_hash.include?(item.name.downcase.to_sym) ? @return_hash[item.name.downcase.to_sym] += 1 : @return_hash[item.name.downcase.to_sym] = 1
      end
    @return_hash
  end

  def total_price
    prices = []
    @items.each {|item| prices << item.price}
    @total = prices.inject(:+)
  end

  def final_price
    total_price
    total_items
    items.each do|item|
      if item.name == 'BOGOF'
        @total = @total - @return_hash[:banana] / 0.5
      elsif item.name == 'BULK'
        @total = @total - @return_hash[:apple] * 0.5
      else
        @total
      end
    end
    @total
  end

end