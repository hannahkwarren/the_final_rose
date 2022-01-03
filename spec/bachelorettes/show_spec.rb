require 'rails_helper'

RSpec.describe "Bachelorette Show Page", type: :feature do 

  before(:each) do
    @bach1 = Bachelorette.create(name: "Monica Noying", season_number: 3, season_description: "More dramatic than ever!")
    @bach2 = Bachelorette.create(name: "Amber Ridiculous", season_number: 1, season_description: "You'll hate everyone by the end!")

    @ryan = Contestant.new(name: "Ryan Immoral", age: 32, hometown: "Nowhere, IL")
    @bach1.contestants << @ryan

    @brad = Contestant.new(name: "Brad Dull", age: 30, hometown: "Constipation, PA")
    @bach1.contestants << @brad

    @arnie = Contestant.new(name: "Arnie Insufferable", age: 36, hometown: "Depression, IL")
    @bach2.contestants << @arnie
  end

  it "shows a bachelorette's details" do 
    visit "/bachelorettes/#{@bach1.id}"

    expect(page).to have_content("Monica Noying")
    expect(page).to have_content("Season: 3")
    expect(page).to have_content("More dramatic than ever!")

    expect(page).to_not have_content("Amber Ridiculous")

    click_link("View #{@bach1.name}'s Contestants")

    expect(current_path).to eq("/bachelorettes/#{@bach1.id}/contestants")
    expect(page).to have_content("Ryan Immoral")
    expect(page).to_not have_content("Arnie Insufferable")
  end

  
  it "shows the average age of all of a bachelorette's contestants" do
  
    visit "/bachelorettes/#{@bach1.id}"

    expect(page).to have_content("Average Contestant Age: 31")
  end 

  
end
