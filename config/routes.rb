Rails.application.routes.draw do
  resources :heros, only: [:index, :show]
  post '/find_hero', to: "heros#find_hero"
  
  get '/badge_templates', to: "badges#get_badge_templates"
  post '/issue_badge', to: "badges#issue_badge"
end
