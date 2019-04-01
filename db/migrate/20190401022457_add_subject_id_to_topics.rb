class AddSubjectIdToTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :subject_id, :integer
  end
end
