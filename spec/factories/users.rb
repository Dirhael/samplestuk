FactoryGirl.define do
  factory :user do
    email {Faker::Internet.email}
    password {Faker::Internet.password(8)}
  end

  factory :user_with_tasks do
    email {Faker::Internet.email}
    password {Faker::Internet.password(8)}
    after(:create) do |task|
      create(:task, task: task)
    end
  end

end
