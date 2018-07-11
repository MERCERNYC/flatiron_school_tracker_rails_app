class CreateLabs < ActiveRecord::Migration[5.2]
  def change
    create_table :labs do |t|
      t.integer :user_id
      t.integer :topics_id
      t.timestamps
    end
  end
end
