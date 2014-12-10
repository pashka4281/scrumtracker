# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Ben Martel"
    sequence(:email) { |n| "mail#{n}@mail.com" }
    password "password"
    password_confirmation "password"
  end
end
