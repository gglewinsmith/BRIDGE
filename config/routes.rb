Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations" }
  resources :fundraising_events do
    resources :loans, only: [:show, :create] do
      resources :payments, only: [:new, :create]
    end
  end

  get 'pages/homepage', to: 'pages#homepage', as: 'homepage'
  get 'pages/dashboard', to: 'pages#dashboard', as: 'dashboard'

  root to: 'pages#homepage'

  get 'pages/applicant', to: 'pages#applicant', as: 'applicant'
  get 'pages/lender', to: 'pages#lender', as: 'lender'

  get '/edit_applicant', to: 'users#edit_applicant', as: 'edit_applicant'
  get '/edit_lender', to: 'users#edit_lender', as: 'edit_lender'
  patch '/update_lender', to: 'users#update_lender', as: 'update_lender'
  patch '/update_applicant', to: 'users#update_applicant', as: 'update_applicant'
end
