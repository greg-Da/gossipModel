class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
    @cities = City.all
  end
  
  def create
    puts params
    
    if params[:password] == params[:password_confirmation]
      
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
        log_in(@user)

        if params[:remember]  == true
          remember(user)
        end


        flash[:success] = "User créé"
        redirect_to gossips_path
      else
        render :new
      end
    else
      flash[:warning] = "Mot de passe différend de la confirmation"
      ender :new
    end
    
  end
  
end
