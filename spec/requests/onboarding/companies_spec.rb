require "rails_helper"

RSpec.describe "Onboarding::Companies", type: :request do
  let(:user) { create(:user) }

  describe "GET /onboarding/company" do
    context "when the user is not authenticated" do
      it "redirects to sign in" do
        get onboarding_company_path

        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "when the user has no company" do
      before do
        sign_in user
      end

      it "allows access to the onboarding page" do
        get onboarding_company_path

        expect(response).to have_http_status(:ok)
      end
    end

    context "when the user already belongs to a company" do
      let(:company) { create(:company) }

      before do
        sign_in user

        create(
          :membership,
          user: user,
          company: company,
          role: :owner,
          status: :active
        )
      end

      it "redirects away from onboarding" do
        get onboarding_company_path

        expect(response).to redirect_to(dashboard_path)
      end
    end
  end

  describe "POST /onboarding/company" do
    before do
      sign_in user
    end

    context "with valid parameters" do
      let(:params) do
        {
          company: {
            name: "Ache Inc"
          }
        }
      end

      it "creates a company" do
        expect {
          post onboarding_company_path, params: params
        }.to change(Company, :count).by(1)
      end

      it "creates a membership" do
        expect {
          post onboarding_company_path, params: params
        }.to change(Membership, :count).by(1)
      end

      it "creates an owner membership" do
        post onboarding_company_path, params: params

        membership = Membership.last

        expect(membership.user).to eq(user)
        expect(membership.role).to eq("owner")
        expect(membership.status).to eq("active")
      end

      it "redirects after successful onboarding" do
        post onboarding_company_path, params: params

        expect(response).to redirect_to(dashboard_path)
      end
    end

    context "with invalid parameters" do
      let(:params) do
        {
          company: {
            name: ""
          }
        }
      end

      it "does not create a company" do
        expect {
          post onboarding_company_path, params: params
        }.not_to change(Company, :count)
      end

      it "does not create a membership" do
        expect {
          post onboarding_company_path, params: params
        }.not_to change(Membership, :count)
      end

      it "returns an unprocessable response" do
        post onboarding_company_path, params: params

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
