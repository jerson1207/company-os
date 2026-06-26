class CreateCompanies < ActiveRecord::Migration[8.1]
  enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

  def change
    create_table :companies, id: :uuid do |t|
      t.string :name, null: false
      t.bigint :owner_id

      t.timestamps
    end

    add_foreign_key :companies, :users, column: :owner_id
  end
end
