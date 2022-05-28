FactoryBot.define do
  factory :purchase do
    name { 'name' }
    amount { 1000 }
    category
    author
  end
end
