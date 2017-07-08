Rails.application.routes.draw do
  devise_for :users
  root "groups#index"
  resources :users , except:[:create,:show]
  resources :groups, except:[:destroy,:show] do
    resources :messages, only:[:index, :create]
  end
end
