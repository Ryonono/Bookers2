Rails.application.routes.draw do

  devise_for :users

  root "users#top"
  get "home/about" => "books#about"


  resources :books do
  end

  resources :users, only: [:show, :index, :edit, :update]
end
