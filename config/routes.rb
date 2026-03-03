Rails.application.routes.draw do
  devise_for :users
  namespace :admin do 
    resources :users

    resources :projects do
      resources :tasks
      resources :assignments, only: [:new, :create, :destroy]
    end
  end
   resources :projects, only: [:index, :show] do
    resources :tasks, only: [:index, :edit, :update]
   end

   root to: "projects#index"
end
