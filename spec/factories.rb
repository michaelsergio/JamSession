FactoryGirl.define do 
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"
#styles {|styles| [styles.association(:personal_style)] }
  end

  factory :style do
    name "Classical"
  end
end
