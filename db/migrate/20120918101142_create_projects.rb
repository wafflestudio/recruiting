class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :link
      t.string :description
      t.date :date_started

      t.timestamps
    end
  end
end
