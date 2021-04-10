FactoryBot.define do
  factory :comment do
    text { 'かわいい' }
    association :user
    association :cosme
  end
end
