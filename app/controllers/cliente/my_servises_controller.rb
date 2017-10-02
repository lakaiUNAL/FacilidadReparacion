class Cliente::MyServisesController < ApplicationController
  before_action :authenticate_customer!
  
  def index
  end

  def new
  end

  def show
  	@content_request = set_request
    @mess = @content_request.content
  end

  def edit
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit( :article, :service_tipe, :description, :address)
    end
end
