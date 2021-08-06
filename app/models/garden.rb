class Garden < ApplicationRecord
  has_many :plots
  has_many :plant_plots, through: :plots
  has_many :plants, through: :plant_plots

  def unique_plants_under_100_days_in_garden
    plants.unique_plants_under_100_days
  end

  # Attempted Extension... 
  # def plant_count
  #   plots.joins(:plants).select('plants.name').group('plants.name').count
  # end
end
