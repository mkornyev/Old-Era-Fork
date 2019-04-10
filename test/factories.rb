FactoryBot.define do
  
  factory :user do
    email { |a| "#{a.username}@example.com".downcase }
  end

end