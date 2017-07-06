Rails.application.routes.draw do
  devise_for :users
  root "messages#index"
  resources :users , except:[:create,:show]
  resources :groups, only:[:new, :create]
end
