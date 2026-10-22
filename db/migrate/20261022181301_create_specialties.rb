class CreateSpecialties < ActiveRecord::Migration[8.1]
  def change
    create_table :specialties do |t|
      t.string :name
      t.text :description
      t.integer :price_cents
      t.boolean :active

      t.timestamps
    end
    add_index :specialties, :name, unique: true
  end
end
