class AddProcessedToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :processed, :integer, :null => true, :default => nil, :index => true
  end
end
