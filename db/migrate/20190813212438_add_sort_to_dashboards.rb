class AddSortToDashboards < ActiveRecord::Migration[5.2]
  def change
    add_column :dashboards, :sort, :integer
  end
end
