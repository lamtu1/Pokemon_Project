json.extract! pokemon, :id, :name, :ability, :height, :weight, :male_chance, :female_chance, :created_at, :updated_at
json.url pokemon_url(pokemon, format: :json)
