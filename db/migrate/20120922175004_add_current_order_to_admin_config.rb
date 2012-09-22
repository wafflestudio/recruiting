class AddCurrentOrderToAdminConfig < ActiveRecord::Migration
  def change
    add_column :admin_configs, :current_order, :integer
  end
end
