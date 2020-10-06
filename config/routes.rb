Rails.application.routes.draw do
  resources :profiles
  resources :weeks
  resources :week_collections
  resources :set_reps
  resources :set_rep_combos
  resources :workouts
  resources :wasps
  resources :max_efforts
  resources :exercises
  devise_for :users
  root 'profiles#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
