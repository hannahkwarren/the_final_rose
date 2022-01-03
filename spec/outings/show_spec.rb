require 'rails_helper'

RSpec.describe "Outing show page", type: :feature do 

  before(:each) do 
    @bach1 = Bachelorette.create(name: "Monica Noying", season_number: 3, season_description: "More dramatic than ever!")
   
    @ryan = Contestant.new(name: "Ryan Immoral", age: 32, hometown: "Nowhere, IL")
    @bach1.contestants << @ryan

    @brad = Contestant.new(name: "Brad Dull", age: 30, hometown: "Constipation, PA")
    @bach1.contestants << @brad 

    @outing1 = @ryan.outings.create(name:"Hiking", location:"Rural Pennsylvania", date:"10/05/2021")
    @outing2 = @ryan.outings.create(name:"Fishing", location:"Rural Virginia", date:"07/10/2021")

    @brad.outings << @outing1
  end

  it "has outing details and contestants who participated w/ count" do

    visit "/outings/#{@outing1.id}"

    expect(page).to have_content(@outing1.name)
    expect(page).to have_content(@outing1.location)
    expect(page).to have_content(@outing1.date)
    expect(page).to have_content(@outing1.contestant_count)
    expect(page).to have_content("Contestants: Ryan Immoral, Brad Dull")
  end


end
