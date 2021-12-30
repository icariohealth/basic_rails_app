class RegistersController < ApplicationController
  before_action :authenticate_user!
  before_action only: [:show, :edit, :update, :destroy]


  # GET /register/new
  def new
    #get current user email
    @current_user = current_user.email
    @register_user = Register.new()
  end


  # POST /registers
  # POST /register.json
  def create
    #check email address is unique
    @user_email = Register.find_by_email(current_user.email)

    if @user_email.nil?
      @register_user = Register.new(register_params)
      @register_user.email = current_user.email
      @register_user.save!
      redirect_to root_path, notice: "Successfully registered for newsletter."
    else
      redirect_to root_path, notice: "#{current_user.email} already registered for newsletter."
    end
  end
  private

  # Never trust parameters from the scary internet, only allow the white list.
  def register_params
    params.require(:register).permit(:first_name, :last_name, :phone_number, :email)
  end
end

