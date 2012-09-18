class AddPriorityToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :priority, :integer

  end
end
