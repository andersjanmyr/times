Times::Application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  get 'welcome/index'
  root 'welcome#index'

  resources :users, path: '', only: [] do
    get 'timesheet/index'
    resources :time_entries, only: [:index, :create]
  end

end
