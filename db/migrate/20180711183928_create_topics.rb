class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :name
      t.string :timeline
      t.string :note
      t.timestamps
    end
  end
end
