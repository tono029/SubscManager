Rails.application.routes.draw do
  resources :subs
  root 'home#top'
  get "home/about"
end
