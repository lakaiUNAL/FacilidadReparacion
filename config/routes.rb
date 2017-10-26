Rails.application.routes.draw do
  namespace :cliente do
    get 'tecnicos_interesados/index'
  end

  namespace :cliente do
    get 'tecnicos_interesados/show'
  end

  namespace :cliente do
    get 'tecnicos_interesados/destroy'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'

  # Paginas estaticas
  get '/blog' => 'static_pages#blog', as: 'blog'
  get '/nosotros' => 'static_pages#about', as: 'about'
  get '/contacto' => 'static_pages#contact', as: 'contact'
  get '/registro' => 'static_pages#register', as: 'register'
  get '/nuestros_servicios' => 'static_pages#our_services', as: 'our_services'
  get '/iniciar_sesion' => 'static_pages#start_session', as: 'start_session'
  
  #get '/solicitar_servicio' => 'cliente/requests#index', as: 'request_service'
  #get '/editar_perfil' => 'cliente/requests#profile', as: 'edit_profile'
  #get '/actualizar_perfil' => 'tecnico/profile#index', as: 'update_profile'
  #get '/servicios_disponibles' => 'tecnico/free_services#index', as: 'worker_services'
  #get '/mis_servicios' => 'cliente/request#index', as: 'my_services' 
  
  # Aquí deberían ir tadas las peticiones y actividades que realiza un cliente
  get '/cliente' => 'cliente/my_servises#index'
  namespace :cliente do
    resources :requests
    resources :my_servises
    resources :profile
  end

  # Aquí deberían ir tadas las peticiones y actividades que realiza un técnico
  get '/tecnico' => 'tecnico/my_services#index'
  namespace :tecnico do
    resources :free_services, :profile
    resources :my_services, except: [:show, :edit, :update]
    resources :supports, except: :index

    post "my_services/create_service" # Crear un nuevo servicio en la tabla servicios

    get 'accept/success'
    post 'accept/agree'  # Postularme para un servicio
    delete 'agenda/cancelar' # Cancelar mi postulacion para un servicio
    get 'agenda/trabajos'

  end

  # Aquí todas la peticiones de inicio de sesión
  devise_for :workers, controllers:{registrations: 'workers/registrations', sessions: 'workers/sessions'} 
  devise_for :customers, controllers:{registrations: 'customers/registrations', sessions: 'customers/sessions', :omniauth_callbacks => "customers/omniauth_callbacks" }  
end