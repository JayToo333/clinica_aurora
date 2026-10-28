# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
num = 0

name = [ "Geral", "Nutrição", "Dermatologista" ]
description = [ "Atendimento geral para consultas.", "Atendimento de alimentação e orientação nutricional.", "Atendimento para condições da pele." ]
price_cents = [ 12400, 25000, 40000 ]

while num < name.length
  Specialty.find_or_create_by!(name: name[num], description: description[num], price_cents: price_cents[num])
  num += 1
end
