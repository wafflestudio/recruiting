class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :content
      t.integer :question_type
      t.string :options
      t.integer :order

      t.timestamps
    end
  end
end
