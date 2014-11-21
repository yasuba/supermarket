require_relative 'item'

class Basket


  def initialize(item=nil)
    @items = []
    @items << item unless item.nil?
  end

  def items
    @items ||= []
  end

  def items=(value)
    @items = value
  end

  def item_count
    @items.count
  end

  def accept(item)
    @items << item
  end

  def remove(item)
    @items.reject! { |x| x if x == item }
  end

  def list_items
    items.map(&:name)
  end

  def total_items
    return_hash = {}
    items.each do |item|
      return_hash.include?(item.name.downcase.to_sym) ? return_hash[item.name.downcase.to_sym] += 1 : return_hash[item.name.downcase.to_sym] = 1
      end
    return_hash

  end






end