class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.boolean :active, default: false
      t.boolean :locked, default: false
      t.references :client, index: true

      t.timestamps
    end
  end
end
