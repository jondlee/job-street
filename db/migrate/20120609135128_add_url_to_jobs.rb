class AddUrlToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :url, :string
  end
end
