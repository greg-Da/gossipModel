class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
    @cities = City.all
  end
  
  def create
    @cities = City.all

    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name], 
      password: params[:password], 
      email: params[:email],
      description: params[:description],
      age: params[:age],
      city: City.find(params[:city])
    )
    
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "User créé"
      redirect_to gossips_path
    else
      render :new
    end
  end
  
end
