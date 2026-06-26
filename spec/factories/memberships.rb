FactoryBot.define do
  factory :membership do
    association :user
    association :company
    role { :member }
    status { :active }
  end
end