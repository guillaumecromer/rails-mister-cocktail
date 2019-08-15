require 'json'

file = File.read('db/ingredients.json')
json = JSON.parse(file)

puts 'Creating seeds...'

json["drinks"].each do |drinks|
  drinks.each do |key, value|
    Ingredient.create!(name: value)
  end
end

puts 'Ingredients created!...'
