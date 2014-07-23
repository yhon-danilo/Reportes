class Reporte < ActiveRecord::Base
	belongs_to :user
	validates :cedula, :presence => true 
	validates :nombre, :presence => true
	validates :telefono, :presence => true
	validates :asociado, :presence => true
	validates :resultado, :presence => true
	validates :referido, :presence => true
#	before_filter :find_user
	
#	def find_user
#		@user=User.find(params[:user_id])
#	end 

	def self.to_csv(options={})
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |reporte|
				csv << reporte.attributes.values_at(*column_names)
			end
		end
	end

end