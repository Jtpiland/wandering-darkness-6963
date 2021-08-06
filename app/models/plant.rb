class Plant < ApplicationRecord
  has_many :plant_plots
  has_many :plots, through: :plant_plots

  def self.unique_plants_under_100_days
     select('plants.name').where('days_to_harvest < ?', 100).distinct
  end
end
