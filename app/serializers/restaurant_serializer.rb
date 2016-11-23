include ActiveModel::Serialization

class RestaurantSerializer < ActiveModel::Serializer

  attributes :id, :name, :description, :rating, :address, :city, :state, :zip
end
