Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace 'api', format: 'json' do
    # get 'index', to: 'home#index'
    get 'weather', to: 'weather#index'
    get 'crypto_currency', to: 'crypto_currency#index'
    get 'gold_price', to: 'gold_price#index'
  end
end
