class UserController < ApplicationController

  def new 
    @user = User.new
  end

  def create(user_params)

    @user = User.new(user_params)
    if @user.save
         
      session[:user_id] = @user.id
      redirect_to root_path, flash: { success: "Signed up successfully" }
    
    else

      flash[:notice] = "Failed to Register"
      render :new
    
    end

  end

  private

  def user_params

    params.require(:user).permit(:email, :password, :role) 
    
  end
end
