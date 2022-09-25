Rails.application.routes.draw do
  get '/heros', to: "heros#get_heros"
  resources :heros
  
  get '/badge_templates', to: "badges#get_badge_templates"
  post '/issue_badge', to: "badges#issue_badge"
  resources :badges
end
