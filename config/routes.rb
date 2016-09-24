Rails.application.routes.draw do
  get 'admin/index'

  resources :questions, only: [:index, :show]
  resource :assign_scores, only: :new
  resource :custom_notifications, only: :new
  resources :answers, only: [] do
    get :valid, on: :member
    get :invalid, on: :collection
    get :show_all, on: :collection
  end
  mount ActionCable.server => '/cable'
end
