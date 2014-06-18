class CreateJoinTableExamQuestion < ActiveRecord::Migration
  def change
    create_join_table :exams, :questions do |t|
      t.index [:exam_id, :question_id]
      # t.index [:question_id, :exam_id]
    end
  end
end
