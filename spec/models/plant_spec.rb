require 'rails_helper'

RSpec.describe Plant do
  before :each do
    # @garden_1 = Garden.create!(name: 'Turing Community Garden', organic: true)
    #
    # @plot_1 = @garden_1.plots.create!(number: 25, size: 'Large', direction: 'East')
    # @plot_2 = @garden_1.plots.create!(number: 20, size: 'Medium', direction: 'East')
    # @plot_3 = @garden_2.plots.create!(number: 15, size: 'Small', direction: 'East')

    @plant_1 = Plant.create!(name: 'Purple Peppers', description: 'Likes well draining soil', days_to_harvest: 90)
    @plant_2 = Plant.create!(name: 'Tomatoes', description: 'Delicious', days_to_harvest: 60)
    @plant_3 = Plant.create!(name: 'Tomatoes', description: 'Grow Tall', days_to_harvest: 95)
    @plant_4 = Plant.create!(name: 'Cucumbers', description: 'Need lots of room to crawl', days_to_harvest: 105)
    @plant_5 = Plant.create!(name: 'Arugala', description: 'Spicy Greens', days_to_harvest: 55)
    @plant_6 = Plant.create!(name: 'Watermelon', description: 'Sweet melons', days_to_harvest: 80)

    # PlantPlot.create!(plant: @plant_1, plot:@plot_1)
    # PlantPlot.create!(plant: @plant_2, plot:@plot_1)
    # PlantPlot.create!(plant: @plant_3, plot:@plot_2)
    # PlantPlot.create!(plant: @plant_4, plot:@plot_2)
    # PlantPlot.create!(plant: @plant_5, plot:@plot_3)
    # PlantPlot.create!(plant: @plant_6, plot:@plot_3)
  end

  describe 'relationships' do
    it { should have_many :plant_plots }
    it { should have_many(:plots).through(:plant_plots) }
  end

  describe '::class methods' do
    describe 'unique_plants_under_100_days' do
      it 'can find all unique plant names with under one hundred days to harvest' do
        expected= []
        Plant.unique_plants_under_100_days.each do |plant|
          expected << plant.name
        end
        expect(expected).to eq(["Tomatoes", "Purple Peppers", "Watermelon", "Arugala"])
      end
    end
  end
end
