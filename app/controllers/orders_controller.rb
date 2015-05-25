class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    
      @orders = Order.search(params[:search]).paginate(:page => params[:page], :per_page => 10)
      p @orders
      p "-------------------"
    
    #respond_with(@orders)
  end

  def show
    #@order
    respond_to do |format|
      format.html
      format.pdf
    end
  end

  def new
    @order = Order.new
    respond_with(@order)
  end

  def edit
  end
  
  
  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.save
    respond_with(@order)
  end

  def update
    @order.update(order_params)
    respond_with(@order)
  end
  
  def import
  Order.import(params[:file])
  redirect_to root_url, notice: "Products imported."
  end

  def destroy
    @order.destroy
    respond_with(@order)
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:order_name, :user_id, :order_date)
    end
end
