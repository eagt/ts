class UsersController < ApplicationController
  

  def index
    #@users = User.all
  end

  def show
    @user = User.find(params[:id])
    
  end

   def new
    @user = User.new
  end

   def create
    #@user = User.new(params[:user])    => Not the final implementation!
    @user = User.new(user_params)
      if @user.save
        flash[:success] = "Welcome to TS App!"
      # Handle a successful save.
        redirect_to @user
      else
       render 'new'
      end
   end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :email, :password,
                                   :password_confirmation)
    end
end
