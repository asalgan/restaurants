include ActiveModel::Serialization

class MenuItemSerializer < ActiveModel::Serializer

  attributes :id, :name, :description, :category

end