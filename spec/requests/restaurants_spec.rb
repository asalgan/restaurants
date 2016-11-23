require 'rails_helper'

RSpec.describe "Restaurants", type: :request do

  describe "GET /restaurants" do

    it "should have a 200 response when an API key is present" do
      @user = FactoryGirl.create(:user)
      get restaurants_path, nil, { 'Authorization' => "Token token=#{ @user.api_key }"  }
      expect(response.content_type).to eq("application/json")
      expect(response).to have_http_status(200)
    end

    it "should have a 401 repsonse when no API key is present" do
      get restaurants_path, nil, { 'Authorization' => nil  }
      expect(response).to have_http_status(401)
    end

    it "should have a 401 repsonse when wrong API key is present" do
      get restaurants_path, nil, { 'Authorization' => "Token token=12345abcd"  }
      expect(response).to have_http_status(401)
    end

  end



  describe "GET /restaurant" do

    it "should have a 200 response when both an API key and restaurant id are present" do
      @user = FactoryGirl.create(:user)
      @restaurant = FactoryGirl.create(:restaurant)
      get restaurant_path, { id: @restaurant.id }, { 'Authorization' => "Token token=#{ @user.api_key }",   }
      expect(response.content_type).to eq("application/json")
      expect(response).to have_http_status(200)
    end

    it "should have a 401 response when no API key is present" do
      @restaurant = FactoryGirl.create(:restaurant)
      get restaurant_path, { id: @restaurant.id }, { 'Authorization' => nil  }
      expect(response).to have_http_status(401)
    end

    it "should have a 401 response when wrong API key is present" do
      @restaurant = FactoryGirl.create(:restaurant)
      get restaurant_path, { id: @restaurant.id }, { 'Authorization' => "Token token=12345abcd"  }
      expect(response).to have_http_status(401)
    end

    it "should have a 404 response when non-existent restaurant ID is entered" do
      @user = FactoryGirl.create(:user)
      get restaurant_path, { id: 0 }, { 'Authorization' => "Token token=#{ @user.api_key }"  }
      expect(response).to have_http_status(404)
    end

  end

end