require "rails_helper"

RSpec.describe "Sign in", type: :request do
  let(:user) { create(:user) }

  it "logs in user successfully" do
    post user_session_path, params: {
      user: {
        email: user.email,
        password: "password123"
      }
    }

    expect(response).to have_http_status(:redirect)
  end
end