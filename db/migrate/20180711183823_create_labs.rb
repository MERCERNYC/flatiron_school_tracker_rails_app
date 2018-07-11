class CreateLabs < ActiveRecord::Migration[5.2]
  def change
    create_table :labs do |t|

      t.timestamps
    end
  end
end
