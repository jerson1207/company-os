RSpec.describe "Sign in", type: :request do
  context "when the user has not completed onboarding" do
    let(:user) { create(:user) }

    it "redirects to onboarding" do
      post user_session_path, params: {
        user: {
          email: user.email,
          password: "password123"
        }
      }

      expect(response).to redirect_to(onboarding_company_path)
    end
  end

  context "when the user already belongs to a company" do
    let(:user) { create(:user, :with_company) }

    it "redirects to the application" do
      post user_session_path, params: {
        user: {
          email: user.email,
          password: "password123"
        }
      }

      expect(response).to redirect_to(root_path)
    end
  end
end
