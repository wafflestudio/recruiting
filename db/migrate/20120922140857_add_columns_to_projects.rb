class AddColumnsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :photo, :string
    add_column :projects, :featured, :integer
    add_column :projects, :available_from, :date

  end
end
