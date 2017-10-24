class Tecnico::FreeServicesController < ApplicationController
  before_action :authenticate_worker!

  def index
    @requests = current_worker.myFreeServices_paginate( params[:page] )
  end

  def show
    @peticion = Request.find(params[:id])
    @lat = "4.6381938"
    @lng = "-74.0840464"
  end
  def new
  end

  def edit
  end
  
end
