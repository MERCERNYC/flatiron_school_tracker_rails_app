Rails.application.routes.draw do

# root_path
  root :to => "static#home"

#creates 7 restful routes
  resources :'topics'
  resources :'students'
end
