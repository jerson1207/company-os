class ApplicationController < ActionController::Base
  layout :layout_by_resource
  allow_browser versions: :modern

  include TenantContext

  before_action :ensure_company_exists

  private

  def ensure_company_exists
    return unless current_user
    return if onboarding_controller?

    if current_user.companies.blank?
      redirect_to onboarding_company_path
    end
  end

  def onboarding_controller?
    controller_path.start_with?("onboarding/")
  end

  def layout_by_resource
    devise_controller? ? "auth" : "application"
  end
end
