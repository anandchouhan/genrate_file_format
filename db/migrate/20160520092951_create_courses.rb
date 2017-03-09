class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :course1
      t.string :course2
      t.string :course3
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
