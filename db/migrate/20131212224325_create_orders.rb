class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :client_id
      t.integer :article_id
      t.integer :quantity
      t.integer :status

      t.timestamps
    end
  end
end
