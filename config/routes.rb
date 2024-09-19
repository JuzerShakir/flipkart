Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :account_block do
    resources :accounts, except: %i[new edit]
  end

  namespace :session_block do
    resources :sessions, only: :new
  end
end
