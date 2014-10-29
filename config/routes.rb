require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]
  resource :tasks, only: [:new, :create]
  
  resources :users, only: [:new, :create] do 
    member do
      post "complete" => "task_completion#create"
    end
  end
      
  constraints Monban::Constraints::SignedIn.new do
    root "tasks#index" 
  end

  constraints Monban::Constraints::SignedOut.new do
    root "homes#show", as: :home
  end
  
end
