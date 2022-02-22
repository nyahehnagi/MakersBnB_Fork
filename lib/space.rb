class Space < Sequel::Model
 # Add validation
  def self.add(name:, description:, price:)
    Space.new(name:)
  end
end

space = Space.new(
      name: params[:name],
      description: params[:description], 
      price: params[:price],
      owner_customer_id: params[:owner_customer_id])
    space.save

  