Rails.application.routes.draw do

  resources :vehicles, only: [:create] do 
    member do 
      post 'assemble' 
    end
  end
 
end
