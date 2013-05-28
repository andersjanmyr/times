Times::Application.routes.draw do
  get "welcome/index"
  root 'welcome#index'
end
