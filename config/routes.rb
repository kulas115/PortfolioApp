Rails.application.routes.draw do

  root 'pages#home'
  get 'about',   to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs
  resources :portfolios

end
