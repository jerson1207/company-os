module TenantContext
  extend ActiveSupport::Concern

  included do
    before_action :set_current_company
    before_action :ensure_company_access
    helper_method :current_company
  end

  def current_company
    @current_company
  end

  private

  def set_current_company
    return unless current_user

    @current_company = current_user.memberships.active.first&.company
  end

  def ensure_company_access
    return unless current_user && current_company

    unless current_user.memberships.exists?(company_id: current_company.id)
      redirect_to onboarding_company_path, alert: "Access denied"
    end
  end
end
