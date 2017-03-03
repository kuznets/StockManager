Rails.application.routes.draw do

  devise_for :users, :path_names => { sign_up: 'registration', sign_in: 'login', sign_out: 'logout'}
  #:controllers => {:registrations => "users/registrations"}
	resources :stocks
	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'stocks#index'
end
