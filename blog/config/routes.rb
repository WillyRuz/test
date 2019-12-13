Rails.application.routes.draw do
  resources :users
  get :hello_word, to: "hell#hello"
end
