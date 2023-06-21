class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :graduation
      t.string :hire
      t.string :position
      t.string :company
      t.string :image

      t.timestamps
    end
  end
end
