class Tecnico::AgendaController < ApplicationController
  before_action :authenticate_worker!
  
  def trabajos
    @Pendientes = current_worker.peticiones_pendientes(params[:page])
    @Agendadas = current_worker.peticiones_pendientes(params[:page])
  end

  def cancelar
    Proposal.destroy( params[:destr] )
    redirect_to tecnico_agenda_trabajos_path
  end

end
