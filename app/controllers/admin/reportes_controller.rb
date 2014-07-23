class Admin::ReportesController < ApplicationController
  def index
  	@user=User.find(params[:user_id])
  	@reportes= @user.reportes.all
    @reportes= @user.reportes.order(:created_at)
    respond_to do |format|
      format.html
      format.csv { render text: @reportes.to_csv }
      format.xls #{ send_data @reportes.to_csv(col_sep: "\t") }
    end
  end

  def show
  	@user=User.find(params[:user_id])
  	@reportes=Reporte.find(params[:id])
  end

  def edit
  end

  def cvs

  end
end
