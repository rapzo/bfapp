class CreateAdminClients < ActiveRecord::Migration
  def change
    create_table :admin_clients do |t|

      t.timestamps
    end
  end
end
