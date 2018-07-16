class CreateLabs < ActiveRecord::Migration[5.2]
  def change
    create_table :labs do |t|
      t.string :name
      t.belongs_to :student_id
      t.belongs_to :topics_id
      t.timestamps
    end
  end
end
