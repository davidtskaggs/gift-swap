Rails.application.routes.draw do
  resources :events
  devise_for :users
  resources :welcome
  resources :events
  root to: redirect('/welcome/show')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
