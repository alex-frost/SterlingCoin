SterlingCoin::Application.routes.draw do
  root 'coin_calculator#new'
  resources :coin_calculator, only: [:new, :create]
end
