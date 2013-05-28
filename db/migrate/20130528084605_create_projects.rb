class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :rate
      t.string :external_name

      t.timestamps
    end
  end
end
