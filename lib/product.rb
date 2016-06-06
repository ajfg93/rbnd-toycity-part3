class Product
  @@products = []

  attr_reader :title, :price, :stock

  def initialize (options = {})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    add_to_products
  end

  def self.all
    @@products
  end

  def self.find_by_title (given_title)
    @@products.each { |product|
      if product.title == given_title
        return product
      end
    }
  end

  def self.in_stock
    @@products.select {|product| product.stock != 0}
  end

  def in_stock?
    @stock != 0
  end

  private

  def add_to_products
     @@products.each do |product|
       if product.title == @title
         raise DuplicateProductError, "DuplicateProduct with same title"
       end
     end
     @@products << self
  end

end
