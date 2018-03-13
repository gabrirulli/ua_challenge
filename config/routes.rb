Rails.application.routes.draw do
  get "hotels", to: "hotels#index"
  post "session", to: "sessions#create"
end
