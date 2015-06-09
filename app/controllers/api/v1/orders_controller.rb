class Api::V1::OrdersController < ApplicationController
#respond_to :json, :js
 #before_action :authenticate
  def index
    @orders = Order.all
    render json: @orders
  end
  
  def posts
     p params
     p '============================='
     @order = Order.new
     @order.order_name = params['order_name']
     @order.user_id = params['user_id']
     @order.order_date = params['order_date']
     @order.lat = ""
     @order.long=""
     @order.description=""
     @order.save
     #update_values :@project, @json['project']
  end
  
  
  
  #=================== httparty integration==================
  #response = HTTParty.get("https://demo-project-sakthee.c9.io/api/v1/orders.json", :headers => { 'Content-Type' => 'application/json' })           
  #@ordr = JSON.parse(response.body)
  #@ordr.each do |ord|
   # ord.delete("id")
   # @order = HTTParty.post("https://demo-project-sakthee.c9.io/api/v1/orders/posts.json", {:body => ord})
   
    #end
  #=========================================================

  #def order_params
   #   params.require(:order).permit(:order_name, :user_id, :order_date)
  #end
end
