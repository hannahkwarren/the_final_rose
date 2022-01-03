require 'rails_helper'

RSpec.describe "Contestant Show Page", type: :feature do 

  before(:each) do
    @bach1 = Bachelorette.create(name: "Monica Noying", season_number: 3, season_description: "More dramatic than ever!")
    @bach2 = Bachelorette.create(name: "Amber Ridiculous", season_number: 1, season_description: "You'll hate everyone by the end!")

    @ryan = Contestant.create(name: "Ryan Immoral", age: 32, hometown: "Nowhere, IL")
    @bach1.contestants << @ryan

    @arnie = Contestant.create(name: "Arnie Insufferable", age: 36, hometown: "Depression, IL")
    @bach2.contestants << @arnie

    @outing1 = @ryan.outings.create(name:"Hiking", location:"Rural Pennsylvania", date:"10/05/2021")
    @outing2 = @ryan.outings.create(name:"Fishing", location:"Rural Virginia", date:"07/10/2021")
  end


  it "contestant show page shows name and season with season description and outings" do 

    visit "/contestants/#{@ryan.id}"

    expect(page).to have_content("Name: Ryan Immoral")
    expect(page).to have_content("Season: 3")
    expect(page).to have_content("More dramatic than ever!")
    expect(page).to have_content("Hiking")
    expect(page).to have_content("Fishing")

    click_link("Hiking")
    expect(current_path).to eq("/outings/#{@outing1.id}")
  end

  
end
