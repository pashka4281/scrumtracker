# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :story do
    title "Some story"
    description "MyText"
    association :project
    type "Story::Task"
    association :user
    state "unstarted"
    points 1
  end
end
