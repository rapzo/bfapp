class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :client_id
      t.string :article_id
      t.integer :quantity
      t.integer :status

      t.timestamps
    end
  end
end
