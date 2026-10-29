class CreateSpecialties < ActiveRecord::Migration[8.1]
  def change
    create_table :specialties do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :price_cents, null: false
      t.boolean :active, default: true, null: false

      t.timestamps
    end
    add_index :specialties, :name, unique: true
  end
end
