class Tecnico::AgendaController < ApplicationController
  before_action :authenticate_worker!
  
  def trabajos
    jobs = Schedule.where( worker_id: current_worker.id )
    @camello = jobs.paginate(page: params[:page], per_page: 10)
  end

  def cancelar
    destruir = params[:destr]
    Schedule.destroy( destruir )
  end
end
