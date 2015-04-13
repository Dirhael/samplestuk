FactoryGirl.define do
  factory :task do
    content {Faker::Lorem.sentence}
    user
    state 'to_do'
  end

  factory :invalid_task, parent: :task do
    content nil
    user nil
    state nil
  end
end
