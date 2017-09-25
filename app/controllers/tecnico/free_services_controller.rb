class Tecnico::FreeServicesController < ApplicationController
  before_action :authenticate_worker!

  def index
    @requests = current_worker.skills.collect(&:service).collect(&:request)
  end

  def show
  end

  def new
  end

  def edit
  end
end
