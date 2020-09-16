class OrderAddress

  include ActiveModel::Model
  attr_accessor :name, :user_id, :item_id, :postal_code, :prefecture_id, :city, :address_line, :building, :phone, :authenticity_token, :token, :order_id
  
  with_options presence: true do
     validates :phone, format: { with: /\A\d{,11}\z/ }
     validates :address_line
     validates :city
     validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
     validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
     validates :token, presence:{ message: 'of credit card is invalid' }
   end

  def save
    order = Order.create(user_id:user_id, item_id:item_id)
    Address.create(phone:phone, address_line:address_line, city:city, postal_code:postal_code, order_id:order.id, building:building)
  end
end