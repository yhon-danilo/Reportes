  class Admin::UsersController < ApplicationController
	#before_action :set_usuario, only: []
  before_filter :save_login_state, :only => [:new, :create]
  
  
  def new

  	@user = User.new

  end

  def create
    
  	@user=User.new(user_params)
    
  	if @user.save
  		flash[:notice]= "Ha creado el usuario correctamente"
  		#flash[:color]="valid"

  	else
  		flash[:notice]= "No se ha creado el usuario"
  		flash[:color]= "Verifique los parametros"
  	end
  	render "new"
    
  end	

  def index
    @user=User.all
  end

  def destroy
    @user=User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path

  end

  def edit
    @user=User.find(params[:id])

  end

  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "EL usuario se ha actualizado"
    end
  end

  def show
    @user=User.find(params[:id])
    @reportes=@user.reportes.all
  end

  def set_usuario
  	@user=User.find(params[:id])
  end

	def user_params
	  params.require(:user).permit(:usuario, :password, :password_confirmation, :nombres, :apellido1, :apellido2)
	end
end
