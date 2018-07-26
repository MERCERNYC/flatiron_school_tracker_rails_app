class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :timeline
      t.string :title
      t.string :lab
      t.string :study_group
      t.integer :student_id
      t.timestamps
    end
  end
end
