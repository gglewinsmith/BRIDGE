Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations" }
  resources :fundraising_events

  get 'pages/homepage', to: 'pages#homepage', as: 'homepage'
  get 'pages/dashboard', to: 'pages#dashboard', as: 'dashboard'

  root to: 'pages#homepage'

  get 'pages/applicant', to: 'pages#applicant', as: 'applicant'
  get 'pages/lender', to: 'pages#lender', as: 'lender'

end
