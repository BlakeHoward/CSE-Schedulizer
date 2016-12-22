class CreateSections < ActiveRecord::Migration[5.0]
  def change
    create_table :sections do |t|
      t.string :time
      t.string :location
      t.integer :instructor_id
      t.integer :course_id

      t.timestamps
    end
  end
end
