class Cliente::RequestsController < ApplicationController
  before_action :authenticate_customer!

  # GET /requests
  # GET /requests.json
  def index
    @requests = current_customer.request
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
    @request = Request.find(params[:id])
  end
  
  def profile
  
  end

  # GET /requests/new
  def new
    @request = Request.new
    @Servicios = Service.all
  end

  # GET /requests/1/edit
  def edit
    set_request
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)
    @request.customer_id = current_customer.id
    respond_to do |format|
      if @request.save #Si fue existosa la creación
        puts "Guardo !!!!"
        format.html { redirect_to cliente_requests_url, notice: 'Request was successfully created.' }
      else
        puts "No guardo !!!!!!"
        puts @requests
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
      respond_to do |format|
      if set_request.update(request_params)
        format.html { redirect_to cliente_requests_url, notice: 'Request was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    set_request.destroy
    respond_to do |format|
      format.html { redirect_to cliente_requests_url, notice: 'Request was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit( :article, :service_id, :description)
    end
end
