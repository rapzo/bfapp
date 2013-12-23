class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :code
      t.string :name
      t.string :nif
      t.string :address
      t.string :phone
      t.string :fax
      t.string :email
      t.string :country
      t.string :market
      t.string :payment_type
      t.string :payment_condition
      t.string :country
      t.integer :discount
      t.string :currency
      t.string :password
      t.string :username

      t.timestamps
    end
  end
end
