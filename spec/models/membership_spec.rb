# spec/models/membership_spec.rb

require "rails_helper"

RSpec.describe Membership, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:company) }
  end

  describe "validations" do
    subject { create(:membership) }

    it do
      is_expected.to validate_uniqueness_of(:user_id)
        .scoped_to(:company_id)
    end
  end

  describe "enums" do
    it do
      is_expected.to define_enum_for(:role)
        .with_values(
          member: 0,
          admin: 1,
          owner: 2
        )
    end

    it do
      is_expected.to define_enum_for(:status)
        .with_values(
          active: 0,
          invited: 1,
          suspended: 2
        )
    end
  end

  describe ".active" do
    it "returns only active memberships" do
      active_membership = create(:membership, status: :active)
      create(:membership, status: :invited)

      expect(Membership.active).to contain_exactly(active_membership)
    end
  end
end