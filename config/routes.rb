Rails.application.routes.draw do
  get 'admin/index'

  resources :questions, only: [:index, :show] do
    resources :answers, only: :index
  end
  resource :custom_notifications, only: :new
  resource :score, only: [] do
    get :assign, on: :collection
  end
  resources :answers, only: [] do
      get :valid, on: :member
      get :invalid, on: :collection
  end
  mount ActionCable.server => '/cable'
end
