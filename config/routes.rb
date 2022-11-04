Rails.application.routes.draw do
  root "pages#home"
  get "about", to: "pages#about"
  resources :articles

  get "signup", to: "users#new" # This is the route for the signup page.
  # post "users", to: "users#create" # This is the route for the form submission.
  resources :users, except: [:new] # This is the same as: resources :users, except: [:new, :create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :categories, except: [:destroy]
end
