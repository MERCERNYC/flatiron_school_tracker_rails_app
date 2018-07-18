Rails.application.routes.draw do
#resource creates 7 restful routes
# root_path
  root :to => "static#home"
  resources :students, only: [:new, :create, :show]

  resources :topics do
      resources :subjects
  end

end
