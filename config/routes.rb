Hogwarts::Application.routes.draw do
  get "welcome/index"

  root to: 'welcome#index'

  get '/houses' => 'houses#List'
  get '/students' => 'students#index'
  get '/students' => 'students#creat'
end
