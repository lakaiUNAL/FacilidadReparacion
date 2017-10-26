class AdminsController < ApplicationController
  def index
     peticion = Admin.new 
     @tecnicos = peticion.tecnicos
     @servicio_requerido = peticion.servicios 
     @clientes = peticion.clientes
     @habilidades = peticion.habilidades
  end
end
