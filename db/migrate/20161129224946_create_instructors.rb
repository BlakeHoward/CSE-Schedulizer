class CreateInstructors < ActiveRecord::Migration[5.0]
  def change
    create_table :instructors do |t|
      t.string :name
      t.float :rmp_ratings
      t.string :rmp_url

      t.timestamps
    end
  end
end
