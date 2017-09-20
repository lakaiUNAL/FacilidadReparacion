Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'

  #Paginas estaticas
  get '/blog' => 'static_pages#blog', as: 'blog'
  get '/nosotros' => 'static_pages#about', as: 'about'
  get '/contacto' => 'static_pages#contact', as: 'contact'
  get '/registro' => 'static_pages#register', as: 'register'
  get '/iniciar_sesion' => 'static_pages#start_session', as: 'start_session'
  
  namespace :cliente do
    resources :requests
  end

  get '/tecnico' => 'tecnico/my_services#index'
  namespace :tecnico do 
    resources :free_services
    resources :my_services
    resources :profile
  end

  devise_for :workers, controllers:{registrations: 'workers/registrations', sessions: 'workers/sessions'} 
  devise_for :customers, controllers:{registrations: 'customers/registrations', sessions: 'customers/sessions'}
  
end