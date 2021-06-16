Rails.application.routes.draw do

  resources :vehicles, only: [:create, :update] do 
    member do 
      post 'assemble' 
      post 'paint'
      post 'test'
    end
    collection do 
      post 'create_state' 
    end
  end
 
end
