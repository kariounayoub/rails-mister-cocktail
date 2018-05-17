require 'json'
require 'open-uri'
puts "cleaning database"
Cocktail.destroy_all
Dose.destroy_all

puts "scrapping ingredients"
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)

ingredients['drinks'].each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
end

puts "creating 20 cocktails and doses"
i = 1
cocktails_name = ['Vanillabean Drink',
'Sherry Knight',
'Jasmine Tonic',
'Evil Slap',
'Beetroot Joke',
'Coriander Wacker',
'Wild Shield',
'Ancient Mix',
'Gleaming Mud',
'Dire Bomb',
'Brutal Blaze',
'Winged Dog',
'Strawberry Burst',
'Tropic Enigma',
'Eastern Four',
'Oblivious Enigma',
'Autumn Earthquake',
'Caramel Zombie',
'Cinnamon Cider',
'Mango Walker']
20.times do

 cocktail = Cocktail.create(
    name:    cocktails_name[i - 1],
    pictureurl: "https://source.unsplash.com/collection/1990254/#{i}"
  )
Dose.create(description: ['A handful', '1 part', '2 parts', '3 parts'].sample, cocktail: cocktail, ingredient: Ingredient.find([1..150].sample))
Dose.create(description: ['A handful', '1 part', '2 parts', '3 parts'].sample, cocktail: cocktail, ingredient: Ingredient.find([1..150].sample))
Dose.create(description: ['A handful', '1 part', '2 parts', '3 parts'].sample, cocktail: cocktail, ingredient: Ingredient.find([1..150].sample))

  i += 1
end

puts "Finished!"
