# As a visitor
# When I visit '/artists/new'
# and I fill in the artist's name
# Then I click 'Create Artist'
# I am redirected to this new artists show page

require "rails_helper"


describe "As a visitor" do
  describe "when I visit new artist form page" do
    it "I cn create new artist" do

      visit '/artists/new'

      fill_in 'Name', with: 'Megan'

      click_on 'Create Artist'

      new_artist = Artist.last

      expect(current_path).to eq("/artists/#{new_artist.id}")
    end
  end
end
