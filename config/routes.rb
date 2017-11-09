Rails.application.routes.draw do
  namespace :cliente do
  end

  namespace :cliente do
  end

  namespace :cliente do
  end

  get 'admins/index'

  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'

  # Paginas estaticas
  get '/blog' => 'static_pages#blog', as: 'blog'
  get '/nosotros' => 'static_pages#about', as: 'about'
  get '/contacto' => 'static_pages#contact', as: 'contact'
  get '/nuestros_servicios' => 'static_pages#our_services', as: 'our_services'
  
  # Aquí deberían ir tadas las peticiones y actividades que realiza un cliente
  get '/cliente' => 'cliente/my_servises#index'
  namespace :cliente do
    resources :requests
    resources :my_servises
    resources :profile

    #TODO: Veri si sepueden usar scopes
    get 'tecnicos_interesados/destroy'
    get 'tecnicos_interesados/show'
    get 'tecnicos_interesados/index'
    get 'tecnicos_interesados/citar/:worker_id/:request_id/:year/:week', to: 'tecnicos_interesados#citar', as: 'tecnicos_interesados_citar'
    post 'tecnicos_interesados/apartar_cita/:worker_id/:request_id/:year/:week/:day/:hour', to: 'tecnicos_interesados#apartar_cita', as: 'tecnicos_interesados_apartar_cita'

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
  devise_for :workers , controllers:{registrations: 'workers/registrations', sessions: 'workers/sessions'} 
  devise_for :customers, controllers:{registrations: 'customers/registrations', sessions: 'customers/sessions', omniauth_callbacks: "customers/omniauth_callbacks" }  
end