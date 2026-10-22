class CreateProfessionals < ActiveRecord::Migration[8.1]
  def change
    create_table :professionals do |t|
      t.integer :specialty_id
      t.string :name
      t.string :registration
      t.text :bio
      t.boolean :active

      t.timestamps
    end
    add_index :professionals, :registration, unique: true
  end
end
