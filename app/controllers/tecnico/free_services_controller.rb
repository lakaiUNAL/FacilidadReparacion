class Tecnico::FreeServicesController < ApplicationController
  before_action :authenticate_worker!

  def index
    @requests = current_worker.myFreeServices_paginate( params[:page] )
  end

  def show

    @peticion = Request.find(params[:id])

    #@bounding_box = [{lat:  @cort1, lng: @cort1}, { lat: @cortc, lng: @corc1}]
    #@lat = @cor1
    #@lng = @cor2

  end
  
  def new
  end

  def edit
  end
  
end

#https://www.youtube.com/watch?v=W0juXNFLd6w
