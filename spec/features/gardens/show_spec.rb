require 'rails_helper'

RSpec.describe 'The Garden Show Page' do
  before :each do
    @garden_1 = Garden.create!(name: 'Turing Community Garden', organic: true)
    @garden_2 = Garden.create!(name: 'Evil Turing Community Garden', organic: false)

    @plot_1 = @garden_1.plots.create!(number: 25, size: 'Large', direction: 'East')
    @plot_2 = @garden_1.plots.create!(number: 20, size: 'Medium', direction: 'East')
    @plot_3 = @garden_2.plots.create!(number: 15, size: 'Small', direction: 'East')

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

    visit garden_path(@garden_1)
  end

  # User Story 3, Garden's Plants
  # As a visitor
  # When I visit an garden's show page
  # Then I see a list of plants that are included in that garden's plots
  # And I see that this list is unique (no duplicate plants)
  # And I see that this list only includes plants that take less than 100 days to harvest

  it 'displays a particular gardens unique plants that take less than one hundred days to harvest' do
    expect(page).to have_content(@plant_1.name)
    expect(page).to have_content(@plant_2.name)
    expect(page).to_not have_content(@plant_4.name)
    expect(page).to_not have_content(@plant_5.name)
    expect(page).to_not have_content(@plant_6.name)
  end
end
