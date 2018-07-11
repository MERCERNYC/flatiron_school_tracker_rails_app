class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :uid
      t.timestamps
    end
  end
end
