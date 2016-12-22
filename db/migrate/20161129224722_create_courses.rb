class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.integer :number
      t.string :name
      t.string :prereq
      t.string :coreq
      t.integer :required
      t.string :outside_prereq
      t.float :credit_hours

      t.timestamps
    end
  end
end
