class Tecnico::MyServicesController < ApplicationController
  before_action :authenticate_worker!

  def index
    skills = current_worker.services
    @services = skills.paginate(page: params[:page], per_page: 10)

    @soportes = current_worker.supports.paginate(page: params[:page], per_page: 10)
  end

  # GET: Para Agregar una nueva habilidad al técnico
  def new
  end

  # DELETE: Para eliminar una habilidad del técnico
  def destroy
    request_skill.destroy
    flash[:success] = "Habilidad eliminada correctamente"
    redirect_to tecnico_my_services_path
  end

  # POST: Cra una nueva habilidad para el técnico
  def create
    # Verificar que el tecnico no preste el servicio
    if current_worker.service_ids.include?(service_id)
      flash.now[:warning] = "Esa habilidad ya la tienes"
      redirect_to tecnico_my_services_path
      return 
    end

    # Guardar el servicio en la base de datos
    tran = Skill.create(worker_id: current_worker.id, service_id: service_id)

    if tran.valid?
      flash[:success] = "Tu habilidad se ha Agregado correctamente"
      redirect_to tecnico_my_services_path
    else
      render :new
    end
  end

  
  private 

  def request_service
      current_worker.services.find(params[:id])
  end

  def request_skill
      current_worker.skills.find_by(service_id: params[:id])
  end

  def service_id
    params.require(:new_service).permit(:service_id)[:service_id].to_i
  end


end
