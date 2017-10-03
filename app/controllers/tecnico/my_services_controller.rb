class Tecnico::MyServicesController < ApplicationController
  before_action :authenticate_worker!
  def index
    skills = current_worker.services
    @services = skills.paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  def new
  end

  def edit
  end
end
