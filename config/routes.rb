Rails.application.routes.draw do
resources :fundraising_events
  devise_for :users


  get 'pages/homepage', to: 'pages#homepage', as: 'homepage'
  get 'pages/applicant_dashboard', to: 'pages#applicant_dashboard', as: 'applicant_dashboard'
  get 'pages/lender_dashboard', to: 'pages#lender_dashboard', as: 'lender_dashboard'

  root to: 'pages#homepage'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
