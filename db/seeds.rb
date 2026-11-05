# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
variables = {
  count: 0,
  id: 0
}

specialties = {
  name: [
    "Geral",
    "Dermatologia",
    "Nutrição"
  ],

  description: [
    "Atendimento geral para consultas.",
    "Atendimento de alimentação e orientação nutricional.",
    "Atendimento para condições da pele."
  ]
}

professionals = {
  name: [
    "Ana Carolina Mendes",
    "Ricardo Almeida Santos",
    "Mariana Costa Oliveira",
    "Gabriel Ferreira Lima",
    "Juliana Martins Ribeiro"
  ],

  bio: [
    "Profissional dedicado ao atendimento geral, prevenção de doenças e acompanhamento da saúde dos pacientes.",
    "Profissional especializada em orientação alimentar, planejamento nutricional e promoção de hábitos saudáveis.",
    "Profissional especializada em cuidados com a pele, prevenção e acompanhamento de condições dermatológicas."
  ]
}

while variables[:count] < professionals[:name].length
  if variables[:count] < specialties[:name].length
    Specialty.find_or_create_by!(
      name: specialties[:name][variables[:id]]
    ) do |specialty|
      specialty.description = specialties[:description][variables[:id]]
      specialty.price_cents = (variables[:id] + 1) * 100
    end
  end

  if variables[:id] < specialties[:name].length
    Professional.find_or_create_by!(
      registration: "REG-#{variables[:count] + 1}"
    ) do |professional|
      professional.name = professionals[:name][variables[:count]]
      professional.bio = professionals[:bio][variables[:id]]
      professional.specialty_id = variables[:id] + 1
    end
    variables[:count] += 1
    variables[:id] += 1
  end

  if variables[:id] == specialties[:name].length
    variables[:id] = 0
  end
end
