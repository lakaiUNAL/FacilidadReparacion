Rails.application.routes.draw do

  get 'welcome/index'

  get '/us' => 'about#us'

  get '/contact' => 'about#contact'

  get '/blog' => 'about#blog'

  get '/login' => 'user#login'

  get '/register' => 'user#register'
  
  get '/t_register' => 'user#tec_register'
  
  get '/u_register' => 'user#user_register'
  
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
