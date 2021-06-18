Rails.application.routes.draw do

  scope '/auth' do 
    post '/signin' => 'user_token#create'
    post '/signup' => 'users#create'
  end

  resources :vehicles, only: [:create, :update] do 
    member do 
      post 'assemble' 
      post 'paint'
      post 'test'
    end
    collection do 
      post 'create_state' 
      post 'order_states'
    end
  end
 
end
