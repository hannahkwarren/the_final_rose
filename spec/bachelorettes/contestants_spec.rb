require 'rails_helper'

RSpec.describe "Bachelorette's contestants page", type: :feature do 

  before(:each) do
    @bach1 = Bachelorette.create(name: "Monica Noying", season_number: 3, season_description: "More dramatic than ever!")
   
    @ryan = Contestant.new(name: "Ryan Immoral", age: 32, hometown: "Nowhere, IL")
    @bach1.contestants << @ryan

    @brad = Contestant.new(name: "Brad Dull", age: 30, hometown: "Constipation, PA")
    @bach1.contestants << @brad 
  end

  it "has contestant details at the bachelorette contestants page and links to the contestant show page" do

    visit "/bachelorettes/#{@bach1.id}/contestants"

    within("#contestant-section-#{@ryan.id}") do
      expect(page).to have_content("Age: 32")
      expect(page).to have_content("Hometown: Nowhere, IL")
    end

    within("#contestant-section-#{@brad.id}") do
      expect(page).to have_content("Age: 30")
      expect(page).to have_content("Hometown: Constipation, PA")
    end

    click_link("Ryan Immoral")

    expect(current_path).to eq("/contestants/#{@ryan.id}")
  end

  it "shows unique list of where Contestants are from" do 

    visit "/bachelorettes/#{@bach1.id}/contestants"

    expect(page).to have_content("Monica Noying's Contestants are from these hometowns:\nConstipation, PA\nNowhere, IL")
  end

end
