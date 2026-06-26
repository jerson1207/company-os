require "rails_helper"

RSpec.describe User, type: :model do
  describe "associations" do
    it do
      is_expected.to have_many(:memberships)
        .dependent(:destroy)
    end

    it do
      is_expected.to have_many(:companies)
        .through(:memberships)
    end
  end
end