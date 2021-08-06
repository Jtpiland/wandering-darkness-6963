require 'rails_helper'

RSpec.describe 'Plot Index Page' do
  before :each do
    @garden_1 = Garden.create!(name: 'Turing Community Garden', organic: true)

    @plot_1 = @garden_1.plots.create!(number: 25, size: 'Large', direction: 'East')
    @plot_2 = @garden_1.plots.create!(number: 20, size: 'Medium', direction: 'East')
    @plot_3 = @garden_1.plots.create!(number: 15, size: 'Small', direction: 'East')

    @plant_1 = Plant.create!(name: 'Purple Peppers', description: 'Likes well draining soil', days_to_harvest: 90)
    @plant_2 = Plant.create!(name: 'Tomatoes', description: 'Delicious', days_to_harvest: 60)
    @plant_3 = Plant.create!(name: 'Green Beans', description: 'Grow Tall', days_to_harvest: 95)
    @plant_4 = Plant.create!(name: 'Cucumbers', description: 'Need lots of room to crawl', days_to_harvest: 70)
    @plant_5 = Plant.create!(name: 'Arugala', description: 'Spicy Greens', days_to_harvest: 55)
    @plant_6 = Plant.create!(name: 'Watermelon', description: 'Sweet melons', days_to_harvest: 80)

    PlantPlot.create!(plant: @plant_1, plot:@plot_1)
    PlantPlot.create!(plant: @plant_2, plot:@plot_1)
    PlantPlot.create!(plant: @plant_3, plot:@plot_2)
    PlantPlot.create!(plant: @plant_4, plot:@plot_2)
    PlantPlot.create!(plant: @plant_5, plot:@plot_3)
    PlantPlot.create!(plant: @plant_6, plot:@plot_3)

    visit plots_path
  end

  # User Story 1, Plots Index Page
  # As a visitor
  # When I visit the plots index page ('/plots')
  # I see a list of all plot numbers
  # And under each plot number I see names of all that plot's plants
  it 'displays a list of all plot numbers' do
    expect(page).to have_content(@plot_1)
    expect(page).to have_content(@plot_2)
    expect(page).to have_content(@plot_3)
  end
  it 'displays a list of all the plots plants under the plot number'
end
