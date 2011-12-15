class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|

      t.string :link, :limit => 500, :null => false
      t.text :description
      t.string :category, :limit => 50

      t.timestamps

    end
  end
end
