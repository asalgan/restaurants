include ActiveModel::Serialization

class RestaurantSerializer < ActiveModel::Serializer

  attributes :id, :name, :description, :address, :city, :state, :zip
end
