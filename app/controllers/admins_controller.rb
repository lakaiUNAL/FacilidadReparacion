class AdminsController < ApplicationController
  def index
     peticion = Admin.new 
     @clientes = peticion.tecnicos
  end
end
