Rails.application.routes.draw do
  devise_for :users
  resources :subs
  root 'home#top'
  get "home/about"
end
