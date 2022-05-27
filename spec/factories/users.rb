FactoryBot.define do
  factory :user, aliases: [:author] do
    name { 'name' }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { 'password' }
  end
end