FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { "password123" }
    password_confirmation { "password123" }
  end

  trait :with_company do
    after(:create) do |user|
      company = create(:company)

      create(
        :membership,
        user: user,
        company: company,
        role: :owner,
        status: :active
      )
    end
  end
end
