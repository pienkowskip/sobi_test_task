Rails.application.routes.draw do
  get 'bike_messages/index'

  root 'bike_messages#index'
end
