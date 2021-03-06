Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get "login" => "users#login_form"
post "login" => "users#login"
get "new" => "users#create_form"
post "users/create" => "users#create"
post "logout" => "users#logout"

get "index" => "tasks#index"
post "tasks/create" => "tasks#create"
post "tasks/done/:id" => "tasks#done"
get "tasks/edit/:id" => "tasks#edit"
post "update" => "tasks#update"

get "/" => "users#login_form"
end
