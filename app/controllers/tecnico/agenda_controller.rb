class Tecnico::AgendaController < ApplicationController
  before_action :authenticate_worker!
  
  def trabajos
    jobs = Proposal.where( worker_id: current_worker.id )
    @tam = jobs.size()
    @camello = jobs.paginate(page: params[:page], per_page: 10)
  end

  def cancelar
    Proposal.destroy( params[:destr] )
    redirect_to tecnico_agenda_trabajos_path
  end
end
