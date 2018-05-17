require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients = JSON.parse(open(url).read)
ingredients['drinks'].each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
end

cocktail = Cocktail.create(name: 'Mojito')
dose = Dose.create(description: 'desc', cocktail: cocktail, ingredient: Ingredient.all.first)
