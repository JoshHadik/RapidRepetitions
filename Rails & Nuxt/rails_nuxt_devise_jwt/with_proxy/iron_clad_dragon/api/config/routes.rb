Rails.application.routes.draw do
  resources :atoms, defaults: {format: :json}

  scope '/auth', defaults: {format: :json} do
    devise_for :users, controllers: {sessions: 'sessions'}
    devise_scope :user do
      get 'users/current', to: 'sessions#show'
    end
  end
end
