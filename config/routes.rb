Rails.application.routes.draw do
  
  
  resources :recurring_services
  
  resources :clients do
    resources :recurring_prices, except: [:index], controller: 'clients/recurring_prices' do
      collection { post :import }
    end
  end
  
  resources :invoices do
    resources :services, except: [:index], controller: 'invoices/services'
    member do
      put :set_sent
      put :set_paid
      get :show_pdf
      get :generate_pdf
    end
  end
    
  resources :clients do
    collection { post :import }
  end
  
  resources :recurring_prices, controller: 'clients/recurring_prices' do
    collection { post :import }
  end
    
  root "clients#index"
  
end
