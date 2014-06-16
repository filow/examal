class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :hashed_password
      t.string :salt
      t.boolean :is_admin,default: false

      t.timestamps
    end
  end
end
