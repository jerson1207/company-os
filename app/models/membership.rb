class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :company

  scope :active, -> { where(status: :active) }

  enum :role, {
    member: 0,
    admin: 1,
    owner: 2
  }

  enum :status, {
    active: 0,
    invited: 1,
    suspended: 2
  }

  validates :user_id,
            uniqueness: { scope: :company_id }
end
