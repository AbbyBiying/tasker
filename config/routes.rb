require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :tasks, only: [:new, :create, :destroy] do
    member do
      post "completed" => "task_completions#create"
    end
  end

  constraints Monban::Constraints::SignedIn.new do
    root "tasks#index"
  end

  constraints Monban::Constraints::SignedOut.new do
    root "homes#show", as: :home
  end
end
