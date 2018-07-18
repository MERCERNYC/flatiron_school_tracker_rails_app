class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :timeline
      t.string :title
      t.string :lab
      t.string :comment
      t.timestamps
    end
  end
end
