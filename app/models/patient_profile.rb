class PatientProfile < ApplicationRecord
    NON_DIGITS = /\D/
    
    belongs_to :user
    
    validate :birth_date_validations

    validates :user_id, presence: true
    validates :email, presence: true, uniqueness: true
    validates :phone, presence: true,  length: { minimum: 10, maximum: 11 }
    validates :birth_date, presence: true
    validates :active, inclusion: { in: [true, false] }
    validates :access_token_version, presence: true

    normalizes :email, with: ->(email) { email.strip.downcase }
    normalizes :phone, with: ->(phone) { phone.gsub(NON_DIGITS, "") }

    private

    def birth_date_validations
        return if birth_date.blank?

        if birth_date > Date.current
            errors.add(:birth_date, "Não pode ser uma data futura")
        elsif birth_date > 18.years.ago.to_date
            errors.add(:birth_date, "Usuário precisa ser maior que 18 anos")
        end
    end
end