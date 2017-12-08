Rails.application.routes.draw do
  
  get 'todos/index'

  get 'projects/index' => 'projects#index'

  post 'projects/:project_id/todo_from_app' => 'todos#create_from_app'

  patch 'projects/:project_id/todos/:id/update_from_app' => 'todos#update_from_app'
    
  root 'todos#index'

  resources :projects do
    resources :todos
  end

end
