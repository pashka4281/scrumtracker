# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    user
    story
    body "Lorem ipsum lalala"
  end
end
