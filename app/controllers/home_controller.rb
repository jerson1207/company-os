class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :ensure_company_exists

  def index
    if user_signed_in?
      redirect_to dashboard_path
    else
      render :index
    end
  end
end
