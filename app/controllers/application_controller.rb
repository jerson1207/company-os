class ApplicationController < ActionController::Base
  layout :layout_by_resource

  allow_browser versions: :modern


  private

  def layout_by_resource  
    if devise_controller?
      "auth"
    else
      "application"
    end
  end
end
