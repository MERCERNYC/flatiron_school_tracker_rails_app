class AddProviderToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :provider, :string
  end
end
