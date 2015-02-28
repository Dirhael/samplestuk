FactoryGirl.define do
  factory :task do
    content {Faker::Lorem.sentence}
  end

  factory :invalid_task, parent: :task do
    content nil
  end

end
