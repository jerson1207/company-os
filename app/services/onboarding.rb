class Onboarding
  def initialize(user:, company_params:)
    @user = user
    @company_params = company_params
  end

  def call
    ActiveRecord::Base.transaction do
      company = create_company
      create_membership(company)

      company
    end
  end

  private

  def create_company
    Company.create!(
      @company_params.merge(
        owner_id: @user.id
      )
    )
  end

  def create_membership(company)
    Membership.create!(
      user: @user,
      company: company,
      role: :owner,
      status: :active
    )
  end
end
