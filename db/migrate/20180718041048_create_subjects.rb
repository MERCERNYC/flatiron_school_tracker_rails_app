class CreateSubjects < ActiveRecord::Migration[5.2]

  def change
    create_table :subjects do |t|
      t.string :name
      t.index :student_id
      t.index :topics_id
      t.timestamps
    end
  end
  
end
