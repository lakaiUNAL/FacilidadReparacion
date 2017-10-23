class Cliente::TecnicosInteresadosController < ApplicationController
  
  before_action :authenticate_customer!
  def index
    cliente = current_customer.id
    interested = Schedule.where(customer_id: cliente)
    @tecnicos = interested.paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  def destroy
  end
end
