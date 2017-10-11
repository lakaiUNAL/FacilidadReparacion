class Tecnico::SupportsController < ApplicationController
	before_action :authenticate_worker!

	def new
		@support = Support.new
	end

	def create
		support = Support.new

		support.worker_id = current_worker.id
		support.document = request_support

		if support.valid?
			support.save
			flash[:success] = "Tu archivo se ha cargado correctamente"
			redirect_to tecnico_my_services_path
		else
			redirect_to new_tecnico_support_path
		end

	end

	def destroy
		request_support = current_worker.supports.find_by(id: params[:id])
    if !request_support.nil?
    	request_support.destroy
    	flash[:success] = "Habilidad eliminada correctamente"
    end

    redirect_to tecnico_my_services_path
    
  end

	private 

	def request_support
		params.require(:support).permit(:document)[:document]
	end

end
