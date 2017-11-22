class Tecnico::AcceptController < ApplicationController
  
  before_action :authenticate_worker!
  
  def success
  end

  # Aceptar una peticion de usuario
  def agree
    
    worker = current_worker.id
    req = params[:request]
    
    if not (Proposal.exists?(worker_id: worker, request_id: req))
      #@shd = Schedule.create(:worker_id => worker, :customer_id => client_id, :request_id => req, :date => fecha)
     petition = Proposal.create(worker_id: worker, request_id: req)
    end
    @cliente =  Customer.find_by(id: petition.request_id)
    NotificationMailer.notification_mail(@cliente).deliver_now
    redirect_to tecnico_agenda_trabajos_path

  end
end
