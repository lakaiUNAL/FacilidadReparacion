class Tecnico::FreeServicesController < ApplicationController
  before_action :authenticate_worker!

  def index
    services = current_worker.services  # Verificar que servicios presta el tecnico
    peticiones = Request.where( service_id: services.ids ) # Consultar a qué peticiones puede aplicar
    @requests = peticiones.paginate(page: params[:page], per_page: 10) # Páginar los resultados
  end

  def show

    @peticion = Request.find(params[:id])
    #@bounding_box = [{lat:  @cort1, lng: @cort1}, { lat: @cortc, lng: @corc1}]
    #@lat = @cor1
    #@lng = @cor2
  end

  def new
  end

  def edit
  end
end

#https://www.youtube.com/watch?v=W0juXNFLd6w
