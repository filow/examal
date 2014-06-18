class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams,options:"charset=utf8" do |t|
      t.string :name,null:false
      t.text :description,null:true
      t.datetime :valid_from
      t.datetime :valid_to
      t.integer :timespan
      t.integer :teacher_id

      t.timestamps
    end
  end
end
