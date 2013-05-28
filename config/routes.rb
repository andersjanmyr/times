Times::Application.routes.draw do
  devise_for :users
  get "welcome/index"
  root 'welcome#index'
end
