require "rails_helper"

RSpec.describe "Sign up", type: :request do
  it "creates a new user" do
    expect {
      post user_registration_path, params: {
        user: attributes_for(:user)
      }
    }.to change(User, :count).by(1)
  end
end
