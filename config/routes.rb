Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, path: 'api/v1', skip: %i[registrations password],
                     path_names: { sign_in: 'login', sign_out: 'logout' },
                     controllers: { sessions: 'api/v1/user/sessions' },
                     defaults: { format: :json }

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :product_prospects, except: %i[delete new]
      resources :products, except: %i[delete new]
      resources :countries, except: %i[delete new]
      resources :stores, except: %i[delete new]
    end
  end
end
