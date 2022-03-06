class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

   def new
     @user = User.new
   end

   def create
      @user = User.create(params.require(:user).permit(:username, :password, :role))
      session[:user_id] = @user.id
      flash[:notice] = "SignUp sussecfully"
      redirect_to '/login'
   end
end
