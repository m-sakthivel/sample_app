class Admin::UsersController < ApplicationController
  layout "admin"
  #prawnto :prawn => { :top_margin => 75 }

  def index
      @users = User.all
      respond_to do |format|
      format.html
      format.csv { send_data @users.to_csv }
      format.xls
    end
  end

  def edit
    @user = User.find(params[:format])
  end

  def update_user
    
  end
  
  def show_order
    @orders = Order.where(user_id: params[:format])
  end

  def delete
    @user = User.find(params[:format])
    @user.destroy
    flash[:notice] = "user deleted"
    redirect_to admin_users_index_path
  end
  
  def update_status
    @user = User.find(params[:format])
    if(@user.status == true)
     User.where(id: params[:format]).update_all(status: false)
     else
    User.where(id: params[:format]).update_all(status: true)
    end
    redirect_to admin_users_index_path
  end
end
