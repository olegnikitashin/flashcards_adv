FactoryGirl.define do
  factory :card do |u|
    u.sequence(:original_text) { |n| "дом #{n}" }
    translated_text 'house'
    interval 1
    repeat 1
    efactor 2.5
    quality 5
    attempt 1
    user
    block
  end
end
