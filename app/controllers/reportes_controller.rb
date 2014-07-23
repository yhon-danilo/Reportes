class ReportesController < ApplicationController
	before_action :set_reporte, only: [:show, :edit, :update, :destroy]	
		
	def new
		@user=User.find(params[:user_id])
		@reporte = @user.reportes.build
	end

	def create
		@user=User.find(params[:user_id])
		@reporte = @user.reportes.build(reporte_params)
		
		if @reporte.save 
		  render "show"
		else
		  render "new"
		end
	end

	def index
		@user=User.find(params[:user_id])
		@reportes = @user.reportes.all
	end

	def update
		if @reporte.update(reporte_params)
			redirect_to @reporte, notice: "El reporte se ha actualizado" 
		end
	end

	def edit
		#@reporte = Reporte.find(reporte_params[:id])

	end

	def destroy
		@user = User.find(params[:user_id])
		@reporte=@user.reportes.find(params[:id])
		@reporte.destroy
		redirect_to user_reportes_path

	end

	def show

	end	



	def reporte_params
		params.require(:reporte).permit(:cedula, :nombre, :apellido1, :apellido2, :dependencia, :telefono, :asociado, :resultado, :referido)
	end

	def set_reporte
		@user = User.find(params[:user_id])
		@reporte=Reporte.find(params[:id])
	end

end