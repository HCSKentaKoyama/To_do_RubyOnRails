Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get "login" => "users#login_form"
post "login" => "users#login"
get "new" => "users#create_form"
post "users/create" => "users#create"

get "index" => "tasks#index"

get "/" => "users#login_form"
end
