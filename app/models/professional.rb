class Professional < ApplicationRecord
  belongs_to :specialty

  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :registration, presence: true, uniqueness: true, length: { minimum: 3, maximum: 50 }
  validates :bio, presence: true, length: { minimum: 20, maximum: 600 }
  validates :active, inclusion: { in: [ true, false ] }
end
