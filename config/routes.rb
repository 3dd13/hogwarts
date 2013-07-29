Hogwarts::Application.routes.draw do
  root to: 'welcome#index'

  resources :houses, only: [:show, :index]

  get '/students' => 'students#index'
  get '/students' => 'students#creat'
end
