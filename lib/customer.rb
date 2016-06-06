class Customer
  @@customers = []

  attr_reader :name

  def initialize(options={})
    @name = options[:name]
    add_customer
  end

  def self.find_by_name (given_name)
    @@customers.each {|customer|
       if customer.name == given_name
         return customer
       end
    }
  end

  def self.all
    @@customers
  end

  private

  def add_customer
    @@customers.each do |customer|
      if customer.name == @name
        raise DuplicateCustomerError, "Customer '#{@name}' aleady exists"
      end
    end
    @@customers << self
  end
end
