class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.string :name
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.boolean :locked, :default => false
      t.boolean :active, :default => false

      t.timestamps
    end
  end
end
