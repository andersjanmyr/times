class CreateTimeEntries < ActiveRecord::Migration
  def change
    create_table :time_entries do |t|
      t.references :user, index: true
      t.references :project, index: true
      t.timestamp :clocked_in
      t.timestamp :clocked_out
      t.string :comment

      t.timestamps
    end
  end
end
