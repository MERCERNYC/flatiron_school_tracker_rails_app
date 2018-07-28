Rails.application.routes.draw do
#resource creates 7 restful routes
# root_path
#sessions
  root :to => "static#home"

  get    '/signup', to: 'students#new'
  post   '/signup', to: 'students#create'

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get "/auth/github/callback" => 'sessions#create'

  get 'two_or_more' => 'topics#two_or_more'


  resources :students

  resources :topics do
    resources :subjects
  end


end
