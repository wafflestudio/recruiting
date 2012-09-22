class AddOptionsToNameAndPhoneInApplicants < ActiveRecord::Migration
  def change
    change_column(:applicants, :name, :string, :default => "", :null => false) 
    change_column(:applicants, :phone, :string, :default => "", :null => false)
  end
end
