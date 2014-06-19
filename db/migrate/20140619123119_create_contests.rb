class CreateContests < ActiveRecord::Migration
  def change
    create_table :contests do |t|
      t.integer :exam_id
      t.integer :student_id
      t.integer :mark

      t.timestamps
    end
    add_index :contests, :exam_id
    add_index :contests, :student_id
  end
end
