require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]
  resources :tasks, only: [:new, :create, :delete] do 
    member do
      post "completed" => "task_completions#create"
    end
  end
  
  resources :users, only: [:new, :create]
      
  constraints Monban::Constraints::SignedIn.new do
    root "tasks#index" 
  end

  constraints Monban::Constraints::SignedOut.new do
    root "homes#show", as: :home
  end
  
end
