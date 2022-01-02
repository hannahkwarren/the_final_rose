class Outing < ApplicationRecord 
  has_many :contestant_outings
  has_many :contestants, through: :contestant_outings

  def contestant_count
    contestants.count
  end

  def contestant_names
    name_string = ""
    countdown = contestant_count
    contestants.each do |contestant|
      name_string += contestant.name
      if countdown != 0
        name_string += ", " 
      end
    end
    name_string
  end
end
