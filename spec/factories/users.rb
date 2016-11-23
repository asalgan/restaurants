FactoryGirl.define do
  factory :user do
    api_key SecureRandom.base64(24)
  end
end