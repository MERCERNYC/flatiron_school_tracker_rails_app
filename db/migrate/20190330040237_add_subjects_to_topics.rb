class AddSubjectsToTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :subject, :string
  end
end
