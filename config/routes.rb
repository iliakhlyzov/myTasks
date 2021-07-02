Rails.application.routes.draw do
  root "project#index"
  get "/projects", to: "project#index"
  post "/todos", to: "project#create"
  patch "/projects/:project_id/todos/:todo_id", to: "project#update"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
