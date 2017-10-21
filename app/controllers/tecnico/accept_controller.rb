class Tecnico::AcceptController < ApplicationController
  def success
  end

  def agree
    client_id = params[:client]
    worker = current_worker.id
    req = params[:request]
    @shd = Schedule.create(:worker_id => worker, :customer_id => client_id, :request_id => req)
  end
end
