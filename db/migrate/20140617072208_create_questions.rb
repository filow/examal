class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions,options:"charset=utf8" do |t|
      t.string :title  ,null:false
      t.string :description ,null:true
      t.text :options ,null:false
      t.integer :teacher_id
      t.string :answer,null:false
      t.boolean :multiple,default:false
      t.integer :difficulty,default:1
      t.index [:title,:teacher_id,:difficulty]
      t.timestamps
    end
  end
end
