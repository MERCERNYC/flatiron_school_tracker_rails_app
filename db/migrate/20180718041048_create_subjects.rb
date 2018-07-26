class CreateSubjects < ActiveRecord::Migration[5.2]

  def change
    create_table :subjects do |t|
      t.string :description
      t.index :student_id
      t.index :topic_id
      t.timestamps
    end
  end

end
