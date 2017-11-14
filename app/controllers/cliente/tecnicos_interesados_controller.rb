class Cliente::TecnicosInteresadosController < ApplicationController
  before_action :authenticate_customer!

  def index
    @peticiones = current_customer.tecnicos_postulados
    @Agendadas = current_customer.schedule
  end

  def show
  end

  def destroy
  end

  # TODO: Verificar que el tecnico este en la lista de postulados 
  # para que no acceda a peticiones fantasma o no autorizadas

  def citar
    @request = Request.find(params[:request_id])
    @tecnico = Worker.find(params[:worker_id])
    @week = params[:week].to_i
    @year = params[:year].to_i
  	@horarios_ocupados = @tecnico.citas_agendadas(@year, @week )
  end

  def apartar_cita
    request = Request.find(datos_cita[:request_id])

    # Crear la cita en la agenda
    cita_nueva = Schedule.new
    
    fecha = Date.commercial(year = datos_cita[:year].to_i, cweek = datos_cita[:week].to_i)
    fecha += datos_cita[:day].to_i.days + datos_cita[:hour].to_i.hours
    
    cita_nueva.date = fecha

    cita_nueva.customer_id = current_customer.id
    cita_nueva.service_id = request.service_id
    cita_nueva.worker_id = datos_cita[:worker_id]

    cita_nueva.save

    #Eliminar el request
    request.destroy

    #TODO: Hacer notificaciones para los tecnicos

    #mensaje de correcto =D
    flash[:success] = "La cita ha sido agendada correctamente"

    #Redireccion
    redirect_to cliente_tecnicos_interesados_index_path

  end

  private 

  def datos_cita
    params.permit(:worker_id, :request_id, :year, :week, :day, :hour)
  end

end
