# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
count = 0

Specialty.find[:name].each do
  specialty_id = count + 1

  specialty_id[1] = {
      description: "Atendimento geral",
      price_cents: 25000
  }

  specialty_id[2] = {
      description: "Atendimento para condições da pele.",
      price_cents: 25000
  }

  specialty_id[3] = {
      description: "Atendimento de alimentação",
      price_cents: 25000
  }
  end
end
