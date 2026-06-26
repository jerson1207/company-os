class CreateMemberships < ActiveRecord::Migration[8.1]
  def change
    create_table :memberships, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true

      t.uuid :company_id, null: false
      t.integer :role, null: false, default: 0

      t.timestamps
    end

    add_foreign_key :memberships, :companies
    add_index :memberships, [ :user_id, :company_id ], unique: true
  end
end
