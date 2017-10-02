module ApplicationHelper

	# Obtener la direccion correcta del link servicios en el header dependiendo de el usuario
	def get_services_page 
		if customer_signed_in?
			cliente_requests_path
		elsif worker_signed_in?
			tecnico_free_services_path
		else
			our_services_path
		end
	end

	# Unificar las queries de Workers y Customers
	def current_user
		if customer_signed_in?
			current_customer
		elsif worker_signed_in?
			current_worker
		else
			nil
		end
	end
end
