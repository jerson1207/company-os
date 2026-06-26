class Company < ApplicationRecord
  belongs_to :owner,
             class_name: "User",
             optional: true

  has_many :memberships,
           dependent: :destroy

  has_many :users,
           through: :memberships

  validates :name,
            presence: true
end
