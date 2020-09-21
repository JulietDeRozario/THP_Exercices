class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.date :start_date
      t.integer :duration
      t.string :title
      t.text :description
      t.integer :price
      t.string :location
      t.references :host, index: true
      t.boolean :is_validated?, null: false, default: false

      t.timestamps
    end
  end
end
