require "rails_helper"

RSpec.describe "Forgot password", type: :request do
  let(:user) { create(:user) }

  it "sends reset password instructions" do
    post user_password_path, params: {
      user: {
        email: user.email
      }
    }

    expect(response).to have_http_status(:redirect)
  end
end