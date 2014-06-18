class AddAverageDifficultyToExams < ActiveRecord::Migration
  def change
    add_column :exams, :average_difficulty, :decimal,precision: 5, scale: 2
  end
end
