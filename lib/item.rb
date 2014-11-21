class Item

  attr_accessor :price
  attr_reader :name

  def initialize(product_info)
    @price = product_info[:price]
    @name =  product_info[:name]
    @for_sale = true
  end

  def for_sale?
    @for_sale
  end

  def sold!
    @for_sale = false
  end


end