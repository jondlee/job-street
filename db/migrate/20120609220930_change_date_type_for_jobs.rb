class ChangeDateTypeForJobs < ActiveRecord::Migration
  def up
    change_table :jobs do |t|
      t.change :date_posted, :date
    end
  end

  def down
    change_table :jobs do |t|
      t.change :date_posted, :datetime
    end
  end
end
