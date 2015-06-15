require 'rails_helper'
describe Order do
  it "is valid with a order_name" do
 contact = Order.new(
       order_name: nil
       )
        contact.valid?
       expect(contact.errors[:order_name]).not_to include("can't be blank")
   end
  
end