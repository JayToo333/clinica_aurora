class Specialty < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 80 }
  validates :description, presence: true, length: { minimum: 20, maximum: 600 }
  validates :price_cents, presence: true
  validates :active, presence: true

  attribute :active, :boolean, default: true
end
