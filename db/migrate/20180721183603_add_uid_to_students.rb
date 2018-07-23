class AddUidToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :uid, :string 
  end
end
