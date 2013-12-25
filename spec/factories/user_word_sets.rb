# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_word_set do
    user

    factory :user_word_set_read do
      permissions 'r'
    end

    factory :user_word_set_write do
      permissions 'w'
    end
  end
end
