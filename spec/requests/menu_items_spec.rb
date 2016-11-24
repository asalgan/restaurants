require 'rails_helper'

RSpec.describe "Menu Items", type: :request do

  describe "GET /menu_items" do

    it "should have a 200 response when an API key, restaurant ID, and menu item ID are present" do
      @user = FactoryGirl.create(:user)
      @restaurant = FactoryGirl.create(:restaurant)
      @menu_item = FactoryGirl.create(:menu_item, restaurant: @restaurant)
      get menu_items_path, { restaurant_id: @restaurant.id }, { 'Authorization' => "Token token=#{ @user.api_key }"  }
      expect(response.content_type).to eq("application/json")
      expect(response).to have_http_status(200)
    end

    it "should have menu items data when API key, restaurant ID, and menu item ID are present" do
      @user = FactoryGirl.create(:user)
      @restaurant = FactoryGirl.create(:restaurant)
      @menu_item = FactoryGirl.create(:menu_item, restaurant: @restaurant)
      get menu_items_path, { restaurant_id: @restaurant.id }, { 'Authorization' => "Token token=#{ @user.api_key }" }
      attributes = JSON.parse(response.body)["data"][0]["attributes"]
      expect(attributes["name"]).to eq @menu_item.name
      expect(attributes["description"]).to eq @menu_item.description
      expect(attributes["category"]).to eq @menu_item.category
      expect(attributes["tags"]).to eq @menu_item.tags
    end

    it "should have a 401 response when no API key is present" do
      get menu_items_path, nil, { 'Authorization' => nil  }
      expect(response).to have_http_status(401)
    end

    it "should have a 401 response when wrong API key is present" do
      get menu_items_path, nil, { 'Authorization' => "Token token=abc123"  }
      expect(response).to have_http_status(401)
    end

    it "should have a 404 response when no restaurant ID is present" do
      @user = FactoryGirl.create(:user)
      get menu_items_path, nil, { 'Authorization' => "Token token=#{ @user.api_key }"  }
      expect(response).to have_http_status(404)
    end

    it "should have a 404 response when non-existent restaurant ID is present" do
      @user = FactoryGirl.create(:user)
      get menu_items_path, { restaurant_id: 0 }, { 'Authorization' => "Token token=#{ @user.api_key }"  }
      expect(response).to have_http_status(404)
    end

  end


  describe "GET /menu_item" do

    it "should have a 200 response when an API key, restaurant ID, and menu item ID are present" do
      @user = FactoryGirl.create(:user)
      @restaurant = FactoryGirl.create(:restaurant)
      @menu_item = FactoryGirl.create(:menu_item, restaurant: @restaurant)
      get menu_item_path, { restaurant_id: @restaurant.id, id: @menu_item.id }, { 'Authorization' => "Token token=#{ @user.api_key }",   }
      expect(response.content_type).to eq("application/json")
      expect(response).to have_http_status(200)
    end

    it "should have menu item data when API key, restaurant ID, and menu item ID are present" do
      @user = FactoryGirl.create(:user)
      @restaurant = FactoryGirl.create(:restaurant)
      @menu_item = FactoryGirl.create(:menu_item, restaurant: @restaurant)
      get menu_items_path, { restaurant_id: @restaurant.id }, { 'Authorization' => "Token token=#{ @user.api_key }" }
      attributes = JSON.parse(response.body)["data"][0]["attributes"]
      expect(attributes["name"]).to eq @menu_item.name
      expect(attributes["description"]).to eq @menu_item.description
      expect(attributes["category"]).to eq @menu_item.category
      expect(attributes["tags"]).to eq @menu_item.tags
    end

    it "should have a 401 response when no API key is present" do
      @restaurant = FactoryGirl.create(:restaurant)
      get menu_item_path, { restaurant_id: @restaurant.id }, { 'Authorization' => nil  }
      expect(response).to have_http_status(401)
    end

    it "should have a 401 response when wrong API key is present" do
      @restaurant = FactoryGirl.create(:restaurant)
      get menu_item_path, { restaurant_id: @restaurant.id }, { 'Authorization' => "Token token=12345abcd"  }
      expect(response).to have_http_status(401)
    end

    it "should have a 404 response when no restaurant ID is entered" do
      @user = FactoryGirl.create(:user)
      @menu_item = FactoryGirl.create(:menu_item)
      get menu_item_path, { id: @menu_item.id }, { 'Authorization' => "Token token=#{ @user.api_key }"  }
      expect(response).to have_http_status(404)
    end

    it "should have a 404 response when wrong restaurant ID is entered" do
      @user = FactoryGirl.create(:user)
      @menu_item = FactoryGirl.create(:menu_item)
      get menu_item_path, { restaurant_id: 0, id: @menu_item.id }, { 'Authorization' => "Token token=#{ @user.api_key }"  }
      expect(response).to have_http_status(404)
    end

    it "should have a 404 response when wrong menu item ID is entered" do
      @user = FactoryGirl.create(:user)
      @restaurant = FactoryGirl.create(:restaurant)
      @menu_item = FactoryGirl.create(:menu_item)
      get menu_item_path, { restaurant_id: @restaurant.id, id: @menu_item.id }, { 'Authorization' => "Token token=#{ @user.api_key }"  }
      expect(response).to have_http_status(404)
    end

  end

end