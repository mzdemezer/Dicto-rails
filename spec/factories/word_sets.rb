FactoryGirl.define do
  sequence :name do |n|
    "word_set_#{n}"
  end

  factory :word_set do
    name
    after(:create) do |word_set|
      word_set.user_word_sets = [ build(:user_word_set_read), build(:user_word_set_write) ]
    end
  end
end
