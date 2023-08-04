class SessionsController < ApplicationController
    def new

    end

    def create
        user = User.find_by(email: params[:email])

        # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
        if user && user.authenticate(params[:password])
          log_in(user)

          if params[:remember]  == true
            remember(user)
          end
  
          # redirige où tu veux, avec un flash ou pas
        flash[:success] = "Connecté"
          redirect_to root_path
        else
          flash[:danger] = 'Invalid email/password combination'
          render 'new'
        end
    end

    def destroy
        log_out(User.find(session[:user_id]))
        flash[:success] = 'User déconnecté'
        redirect_to root_path
    end

end
