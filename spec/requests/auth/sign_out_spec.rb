require "rails_helper"

RSpec.describe "Sign out", type: :request do
  let(:user) { create(:user) }

  it "logs out user successfully" do
    sign_in user

    delete destroy_user_session_path

    expect(response).to have_http_status(:redirect)
  end
end