class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all.paginate(:page => params[:page], :per_page => 10)
    
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @countries = Country.all
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
     twilio_sid = "AC87d4a655d1b7f6251393db346fd69d46"
    twilio_token = "3a1d3e17645ced5700606682a613485d"
    twilio_phone_number = "2678677556"
 
    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
 
    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => '+919042755963',
      :body => "This is an message. It gets sent to"
    )
    @employee = Employee.new(employee_params)
   

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def find_state
    states =  State.where(country_id: params[:id])
    render :json => [states] if states
  end
  
  def user_list
    @exist =  Follow.select('following_id').where(:user_id => current_user.id, :status => true)
    #@users = User.where.not("id = ?",current_user.id).order("created_at DESC")
    @users = User.select('id,user_name').all
    # @conversations = Conversation.involving(current_user).order("created_at DESC")
  end
  
  def subscribe_user
    @exist =  Follow.select('id, status').where(:following_id => params[:id], :user_id => current_user.id).first
    if @exist 
       if @exist.status == true
         Follow.where(id: @exist.id).update_all(status: false)
       else
         Follow.where(id: @exist.id).update_all(status: true)
       end
       redirect_to orders_path
     else
     @follow = Follow.new
     @follow.following_id = params[:id]
     @follow.user_id = current_user.id
     @follow.status = true
     @follow.save
     redirect_to orders_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:employee_name, :employee_id, :employee_address)
    end
    
    
end
