class Onboarding::CompaniesController < ApplicationController
  before_action :authenticate_user!
  layout "auth"

  def show
    redirect_to dashboard_path and return if current_user.memberships.active.exists?

    @company = Company.new
  end

  def create
    if current_user.companies.exists?
      redirect_to dashboard_path and return
    end

    company = Onboarding.new(
      user: current_user,
      company_params: company_params
    ).call

    redirect_to dashboard_path
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end
end
