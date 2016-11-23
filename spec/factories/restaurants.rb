FactoryGirl.define do
  factory :restaurant do
    name "MyString"
    description "MyText"
    rating 3.4
    address "123 Main St."
    city "Chicago"
    state "IL"
    zip 60657
  end
end