# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :story do
    title "MyString"
    description "MyText"
    project_id 1
    type ""
    user_id 1
    state "MyString"
    points 1
  end
end
