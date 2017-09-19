json.extract! request, :id, :customer_id, :article, :service_tipe, :description, :address, :created_at, :updated_at
json.url request_url(request, format: :json)
