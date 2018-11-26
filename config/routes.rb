Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations" }

  resources :fundraising_events do
    get 'cv', to: 'fundraising_events#cv'
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
