Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :product_prospects, except: %i[delete new]
      resources :products, except: %i[delete new]
      resources :countries, except: %i[delete new]
      resources :stores, except: %i[delete new]
    end
  end
end
