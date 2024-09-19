class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :email, default: "", null: false
      t.string :password_digest, default: "", null: false
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
    add_index :accounts, :email, unique: true
  end
end
