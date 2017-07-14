Rails.application.routes.draw do
  devise_for :users
  root "groups#index"
  resources :users , except:[:create,:show] do
      collection do
      get "search"
    end
  end
  resources :groups, except:[:destroy,:show] do
    resources :messages, only:[:index, :create]
  end
end
