class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :content
      t.string :image
      t.date :date
      t.string :location

      t.timestamps
    end
  end
end
