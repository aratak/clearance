class CreateClearanceUsers < ActiveRecord::Migration
  def self.up
    create_table :users  do |t|
      t.timestamps null: false
      t.string :email, null: false
      t.string :encrypted_password, limit: 128, null: false
      t.string :confirmation_token, limit: 128
      t.string :remember_token, limit: 128, null: false
      t.integer :company_id, default: nil
    end

    add_index :users, [:email, :company_id]
    add_index :users, :remember_token
  end

  def self.down
    drop_table :users
  end
end
