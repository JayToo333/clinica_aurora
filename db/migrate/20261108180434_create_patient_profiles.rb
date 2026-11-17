class CreatePatientProfiles < ActiveRecord::Migration[8.1]
  def change
    create_table :patient_profiles do |t|
      t.references :user, null: false, foreign_key: true, index: { unique: true }
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.date :birth_date, null: false
      t.boolean :active, default: true, null: false
      t.integer :access_token_version, null: false, default: 0

      t.timestamps
    end
    add_index :patient_profiles, :email, unique: true
  end
end
