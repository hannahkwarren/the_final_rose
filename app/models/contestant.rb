class Contestant < ApplicationRecord
  belongs_to :bachelorette

  has_many :contestant_outings
  has_many :outings, through: :contestant_outings
  
  def contestants_season_num
    bachelorette.season_number
  end

  def contestants_season_descr
    bachelorette.season_description
  end

  def self.average_age 
    average(:age).round
  end

  def self.hometowns_by_season
    distinct.pluck(:hometown)
  end
end
