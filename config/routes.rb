Rails.application.routes.draw do

  get '/restaurants', to: "restaurants#index"
  get '/restaurant', to: "restaurants#show"

  get '/menu_items', to: "menu_items#index"
  get '/menu_item', to: "menu_items#show"

  get '*path', to: "application#not_found"


  ## curl -H "Authorization: Token token=1Kbr4GuHhVsYBqmHsXkp5SCwz48GFc8W" http://127.0.0.1:3000/restaurants.json

  ## RESTAURANTS
  ## curl -X GET http://127.0.0.1:3000/restaurants
  ## curl -d "id=XXX" -X GET http://127.0.0.1:3000/restaurants

  ## MENU ITEMS
  ## curl -d "restaurant_id=XXX" -X GET http://127.0.0.1:3000/menu_items
  ## curl -d "restaurant_id=XXX" -d "id=XXX" -X GET http://127.0.0.1:3000/menu_item

end
