class CreateAdminConfigs < ActiveRecord::Migration
  def change
    create_table :admin_configs do |t|
      t.datetime :deadline

      t.timestamps
    end
  end
end
