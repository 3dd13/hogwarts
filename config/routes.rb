Hogwarts::Application.routes.draw do
  root to: 'welcome#index'

  resources :houses, only: [:show, :index]
  resources :students, only: [:new, :show, :index, :create]
end
