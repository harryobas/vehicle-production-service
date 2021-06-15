Rails.application.routes.draw do

  resources :vehicles, only: [:create] do 
    member do 
      post 'assemble' 
      post 'paint'
      post 'test'
    end
  end
 
end
