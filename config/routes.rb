Rails.application.routes.draw do

	root :to => "user#login_gui"
	#user routes
	get 'user/login_gui' => 'user#login_gui'
	post 'user/login' => 'user#login'
	get 'user/register_gui' => 'user#register_gui'
	post 'user/register' => 'user#register'

	get 'user/profile' => 'user#profile'
	get 'user/logout' => 'user#logout'

	#pet routes
	get 'pet/register_gui' => 'pet#register_gui'
	get 'pet/show' => 'pet#show'
	post 'pet/register' => 'pet#register'
	post 'pet/pending_user' => 'pet#pending_user'
	post 'pet/register_user' => 'pet#register_user'
	get 'pet/register_user_gui' => 'pet#register_user_gui'
	post 'pet/register_clinic' => 'pet#register_clinic'
	post 'pet/change_status' => 'pet#change_status'

	#story route
	get 'story/show' => 'story#show'
	post 'story/create' => 'story#create'
	get 'story/create_gui' => 'story#create_gui'
	
	#clinic routes
	get 'clinic/seed' => 'clinic#seed'
	get 'clinic/show' => 'clinic#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
