class MenuItem < ActiveRecord::Base
  belongs_to :restaurant
  serialize :tags, Array

  enum category: %w(entree appetizer dessert beverage side)

end
