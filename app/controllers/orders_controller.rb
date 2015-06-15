#require 'actionpack/action_caching'
class OrdersController < ApplicationController
  include HTTParty
  before_action :set_order, only: [:show, :edit, :update, :destroy]
   #newly inserted via vim editor
  respond_to :html, :json
  
  #caches_action :index
  #edit here thoukljkfjaj
  def index
    
      @orders = Order.search(params[:search]).paginate(:page => params[:page], :per_page => 10)
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
  
  def autocomplete
  #query_string = "%#{params[:term]}%"
  @products = Order.where("order_name LIKE ?", "%#{params[:term]}%")
  render json: @products.map(&:order_name)
      
  end
  
  def create
    
    @order = Order.new(order_params)
    #@order.lat = "13.024051"
    #@order.long = "80.224027"
    @order.user_id = current_user.id
    @order.save
    # if request.xhr?
    #   render index
    # expire_action :action=> :index
    
    respond_with(@order)
    #end
  end

  def update
    @order.update(order_params)
    respond_with(@order)
  end
  
  def import
    if(params[:file])
     Order.import(params[:file])
     redirect_to root_url, notice: "Products imported."
    else
     flash.now[:alert] = 'please upload file'  
     redirect_to orders_path
    end
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


