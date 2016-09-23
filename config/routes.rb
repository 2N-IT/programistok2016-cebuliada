Rails.application.routes.draw do
  get 'admin/index'

  resources :questions, only: [:index, :show] do
    resources :answers, only: :index
  end

  resources :answers, only: [] do
      get :valid, on: :member
      get :invalid, on: :collection
  end
  mount ActionCable.server => '/cable'
end
