Hogwarts::Application.routes.draw do
  root to: 'welcome#index'

  get '/houses' => 'houses#List'
  get '/students' => 'students#index'
  get '/students' => 'students#creat'
end
