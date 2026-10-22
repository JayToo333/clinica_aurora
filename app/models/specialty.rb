class Specialty < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 80 }
  validates :description, length: { minimum: 20, maximum: 600 }
end
