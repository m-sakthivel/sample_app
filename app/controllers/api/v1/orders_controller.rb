class Api::V1::OrdersController < ApplicationController
respond_to :json
 before_action :authenticate
  def index
    @orders = Order.all
    respond_with @orders
  end
end
