class Product
  @@products = []

  attr_reader :title

  def initialize (options = {})
    @title = options[:title]
    add_to_products
  end

  def self.all
    @@products
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
