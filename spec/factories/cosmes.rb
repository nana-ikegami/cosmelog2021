FactoryBot.define do
  factory :cosme do
    text { 'アイシャドウ' }
    title { 'アディクション' }
    association :user
    after(:build) do |cosme|
      cosme.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
