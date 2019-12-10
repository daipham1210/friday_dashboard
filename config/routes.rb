Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace 'api', format: 'json' do
    get 'index', to: 'home#index'
  end
end
