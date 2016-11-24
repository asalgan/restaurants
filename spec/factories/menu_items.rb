FactoryGirl.define do
  factory :menu_item do
    restaurant
    name "MyString"
    description "MyText"
    category 1
    tags ["tag1", "tag2", "tag3"]
  end
end
