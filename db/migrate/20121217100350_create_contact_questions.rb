class CreateContactQuestions < ActiveRecord::Migration
  def change
    create_table :contact_questions do |t|
      t.string :question
      t.text :answer
      t.timestamps
    end
  end
end
