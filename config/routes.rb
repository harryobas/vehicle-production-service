Rails.application.routes.draw do

  resources :vehicles, only: [:create] 
 
end
