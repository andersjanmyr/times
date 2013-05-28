Times::Application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  get 'welcome/index'
  root 'welcome#index'

  get 'timesheet/index'
  resources :time_entries, only: [:new, :create]

end
