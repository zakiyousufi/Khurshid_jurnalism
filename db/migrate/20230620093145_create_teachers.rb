class CreateTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :teachers do |t|
      t.string :name
      t.text :description
      t.text :field
      t.text :degree
      t.text :experience
      t.string :image

      t.timestamps
    end
  end
end
