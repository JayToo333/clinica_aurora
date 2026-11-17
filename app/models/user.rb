class User < ApplicationRecord
  has_secure_password

  has_many :sessions, dependent: :destroy
  
  has_one :patient_profile
  
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :role, presence: true
  validates :active, presence: true, inclusion: { in: [ true, false ] }

  normalizes :email, with: ->(email) { email.strip.downcase }

  enum :role, {
    patient: 0,
    manager: 1
  }, default: :patient
end
