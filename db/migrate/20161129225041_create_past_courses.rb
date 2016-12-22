class CreatePastCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :past_courses do |t|
      t.string :user
      t.integer :course_id
      t.integer :user_id

      t.timestamps
    end
  end
end
