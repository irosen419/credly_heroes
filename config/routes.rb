Rails.application.routes.draw do
  get '/heros', to: "heros#get_heros"
  resources :heros
end
