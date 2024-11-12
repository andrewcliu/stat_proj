Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'coingecko/market_data', to: 'coingecko#market_data'

  root 'static#index'
end
