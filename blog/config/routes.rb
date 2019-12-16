Rails.application.routes.draw do
  get 'reports/info'
  resources :users
  get :hello_word, to: "hell#hello"
  get :reports/info, to: "info#info"
end
