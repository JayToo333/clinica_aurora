class Professional < ApplicationRecord
  belongs_to :specialty

  validates :specialty_id, presence: true
  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :registration, presence: true, uniqueness: true, length: { minimum: 3, maximum: 50 }
  validates :bio, presence: true, length: { minimum: 20, maximum: 600 }
  validates :active, presence: true, inclusion: { in: [ true, false ] }

end
