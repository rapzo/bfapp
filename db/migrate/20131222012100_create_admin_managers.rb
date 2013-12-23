class CreateAdminManagers < ActiveRecord::Migration
  def change
    create_table :admin_managers do |t|

      t.timestamps
    end
  end
end
