class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students,options:"charset=utf8" do |t|
      t.string :stuid , limit:50
      t.string :name ,null:false
      t.string :hashed_password
      t.boolean :sex ,null: true
      t.string :profession ,null:true
      t.integer :grade ,null:true

      t.timestamps
    end
  end
end
