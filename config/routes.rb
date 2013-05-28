Times::Application.routes.draw do
  get "timesheet/index"
  devise_for :users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  get "welcome/index"
  root 'welcome#index'
end
