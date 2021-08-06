# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Garden.create(name: 'Turing Community Garden', organic: true)
# Garden.create(name: 'Main Street Garden', organic: false)
#
# Garden.first.plots.create(number: 345, size: 'Medium', direction: 'North')
# Garden.first.plots.create(number: 346, size: 'Large', direction: 'East')
# Garden.last.plots.create(number: 878, size: 'Small', direction: 'East')
# Garden.last.plots.create(number: 879, size: 'Small', direction: 'West')
PlantPlot.destroy_all
Plant.destroy_all
Plot.destroy_all
Garden.destroy_all

@garden_1 = Garden.create!(name: 'Turing Community Garden', organic: true)

@plot_1 = @garden_1.plots.create!(number: 25, size: 'Large', direction: 'East')
@plot_2 = @garden_1.plots.create!(number: 20, size: 'Medium', direction: 'East')
@plot_3 = @garden_1.plots.create!(number: 15, size: 'Small', direction: 'East')

@plant_1 = Plant.create!(name: 'Purple Peppers', description: 'Likes well draining soil', days_to_harvest: 90)
@plant_2 = Plant.create!(name: 'Tomatoes', description: 'Delicious', days_to_harvest: 60)
@plant_3 = Plant.create!(name: 'Tomatoes', description: 'Grow Tall', days_to_harvest: 95)
@plant_4 = Plant.create!(name: 'Cucumbers', description: 'Need lots of room to crawl', days_to_harvest: 105)
@plant_5 = Plant.create!(name: 'Arugala', description: 'Spicy Greens', days_to_harvest: 55)
@plant_6 = Plant.create!(name: 'Watermelon', description: 'Sweet melons', days_to_harvest: 80)

PlantPlot.create!(plant: @plant_1, plot:@plot_1)
PlantPlot.create!(plant: @plant_2, plot:@plot_1)
PlantPlot.create!(plant: @plant_3, plot:@plot_2)
PlantPlot.create!(plant: @plant_4, plot:@plot_2)
PlantPlot.create!(plant: @plant_5, plot:@plot_3)
PlantPlot.create!(plant: @plant_6, plot:@plot_3)
