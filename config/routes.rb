Rails.application.routes.draw do
  resources :payments, only: [:new, :create]
  devise_for :users
  get 'payments/new'
  get 'payment-thanks', to: 'payments#thanks', as: 'payment_thanks'
  resources :charges, only: [:new, :create]
  get 'thanks', to: 'charges#thanks', as: 'thanks'
  get "stripe/connect", to: "stripe#connect", as: :stripe_connect
  get "stripe/dashboard/:user_id", to: "stripe#dashboard", as: :stripe_dashboard
  root to: 'payments#new'
end