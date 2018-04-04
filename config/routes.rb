TechReviewSite::Application.routes.draw do
  devise_for :users
  root 'products#index'

  resources :products, only: :show do
    resources :reviews, only: [:new, :create]
    collection do
      get 'search'
    end
  end

  resources :users, only: :show

end
