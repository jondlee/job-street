class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :position
      t.string :company
      t.string :town
      t.datetime :date_posted
      t.text :description

      t.timestamps
    end
  end
end
