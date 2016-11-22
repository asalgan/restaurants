class MenuItem < ActiveRecord::Base
  belongs_to :restaurant

  enum category: %w(entree appetizer dessert beverage side)

end
