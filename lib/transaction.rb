class Transaction
  @@id = 1
  @@transactions = []
  attr_reader :customer, :product, :id

  def initialize(customer, product)
    @customer = customer
    @product = product
    add_transaction
    product.sell_one_product
    @id = @@id
    @@id += 1
  end

  def self.all
    @@transactions
  end

  def self.find (id)
    @@transactions.each { |transaction|
      if transaction.id == id
        return transaction
      end
    }
  end

  private

  def add_transaction
    if @product.stock == 0
      raise OutOfStockError, "#{@product} is out of stock"
    else
    @@transactions << self
    end
  end

end
