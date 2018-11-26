Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations" }
  resources :conversations do
    resources :messages
  end
  resources :fundraising_events do
    resources :loans, only: [:show, :create, :index] do
      resources :payments, only: [:new, :create]
    end
  end

  get 'pages/homepage', to: 'pages#homepage', as: 'homepage'
  get 'pages/dashboard', to: 'pages#dashboard', as: 'dashboard'
  get 'pages/applicant', to: 'pages#applicant', as: 'applicant'
  get 'pages/lender', to: 'pages#lender', as: 'lender'

  root to: 'pages#homepage'

end
