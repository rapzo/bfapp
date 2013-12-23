class CreateAdminOrders < ActiveRecord::Migration
  def change
    create_table :admin_orders do |t|

      t.timestamps
    end
  end
end
