class CreateProfessionals < ActiveRecord::Migration[8.1]
  def change
    create_table :professionals do |t|
      t.integer :specialty_id, null: false
      t.string :name, null: false
      t.string :registration, null: false
      t.text :bio, null: false
      t.boolean :active, default: true, null: false

      t.timestamps
    end
    add_index :professionals, :registration, unique: true
    add_index :professionals, :specialty_id, unique: true
  end
end
