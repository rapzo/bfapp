class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :code
      t.string :name
      t.string :price
      t.string :unit

      t.timestamps
    end
  end
end
