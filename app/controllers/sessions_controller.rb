class SessionsController < ApplicationController
	before_action :authenticate_user, :only => [:home, :profile, :setting]
	before_action :save_login_state, :only => [:new, :create]
	def new
	end



	def create
		
		authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
		
		if authorized_user
			puts "se autorizo"
			session[:user_id] = authorized_user.id
			flash[:notice] = "Bienvenido, Has iniciado sesion como: #{authorized_user.usuario}"
			if authorized_user.usuario == "alagos"
				flash[:notice]= "Bienvenido administrador: #{authorized_user.usuario}"
				redirect_to(admin_users_path)
			else			
				redirect_to(user_reportes_path(session[:user_id]))
			end
			
			
		else
			puts "no se autorizo"
			flash[:notice] = "Usuario o contrasena invalidos"
			flash[:color]= "invalid"
			
			render :new	
		end

	end
	def destroy
		render "new"
	end

	def logout
		session[:user_id] = nil
		redirect_to :action => 'new'
	end

  	def home

  	end

  	def profile
  	end

  	def setting
  	end
end
	