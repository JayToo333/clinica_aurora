class Professional < ApplicationRecord
  validates :name, length: { minimum: 30, maximum: 100 }
  validates :registration, length: { minimum: 3, maximum: 50 }
  validates :bio, length: { minimum: 20, maximum: 600 }
end
