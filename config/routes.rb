Rails.application.routes.draw do

  scope '/auth' do 
    post '/signin' => 'user_token#create'
    post '/signup' => 'users#create'
  end

  scope '/states' do 
    post '/create_state' => 'vehicle_state_machine#create_state'  
    post '/order_states' => 'vehicle_state_machine#order_states'
    post '/delete_state' => 'vehicle_state_machine#delete_state'
  end

  resources :vehicles, only: [:index, :show, :create] do 
    member do 
      post 'assemble' 
      post 'paint'
      post 'test'
    end
  end
 
end
