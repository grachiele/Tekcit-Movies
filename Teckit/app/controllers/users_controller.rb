class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:message] = "Welcome to Teckít!"
      redirect_to root_path
    else
      flash[:message] = "One or more fields is invalid."
      render :new
    end
  end

  def show
    if is_current_user? == false
      redirect_to ('/422')
    end
    @user = User.find(session[:user_id])
    @tickets = Ticket.all.select { |ticket| ticket.user_id == @user.id}
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
    end

end
