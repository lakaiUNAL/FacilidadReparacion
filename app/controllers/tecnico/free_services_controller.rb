class Tecnico::FreeServicesController < ApplicationController
  before_action :authenticate_worker!

  def index
    services = current_worker.services  # Verificar que servicios presta el tecnico
    peticiones = Request.where( service_id: services.ids ) # Consultar a qué peticiones puede aplicar
    @requests = peticiones.paginate(page: params[:page], per_page: 10) # Páginar los resultados
  end

  def show
    @peticion = Request.find(params[:id])
  end

  def new
  end

  def edit
  end
end
