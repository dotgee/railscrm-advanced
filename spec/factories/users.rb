FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end

  factory :user do
    first_name            'Test'
    last_name             'User'
    phone                 '1231231234'
    email
    password              'password'
    password_confirmation 'password'


    factory :admin_user do
      admin true
    end
    
  end

end
