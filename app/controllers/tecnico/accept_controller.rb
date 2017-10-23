class Tecnico::AcceptController < ApplicationController
  
  before_action :authenticate_worker!
  
  def success
  end

  def agree
    client_id = params[:client]
    worker = current_worker.id
    req = params[:request]
    fecha = params[:date]
    if (Schedule.exists?(worker_id: worker,customer_id: client_id,request_id: req)) == false
      @shd = Schedule.create(:worker_id => worker, :customer_id => client_id, :request_id => req, :date => fecha)
    else
      @shd = 0
    end
  end
end
