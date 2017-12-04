Rails.application.routes.draw do
  
  get 'todos/index'
    
  root 'todos#index'

  resources :projects do
    resources :todos
  end

end
