Rails.application.routes.draw do

  resources :teams do
    member do
      get :current_state
    end
  end

end
