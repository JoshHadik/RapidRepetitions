Rails.application.routes.draw do
  scope '/api', defaults: {format: :json} do
    resources :atoms

    scope '/auth', defaults: {format: :json} do
      devise_for :users, controllers: {sessions: 'sessions'}
      devise_scope :user do
        get 'users/current', to: 'sessions#show'
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
