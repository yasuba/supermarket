class Item

  attr_accessor :price
  attr_reader :name

  def initialize(product_info)
    @price = product_info[1]
    @name =  product_info[0]
    @for_sale = true
  end

  def for_sale?
    @for_sale
  end

  def buy!
    @for_sale = false
  end

  def return!
    @for_sale = true
  end

end