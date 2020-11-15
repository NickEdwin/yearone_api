require "rails_helper"

RSpec.describe 'As any user' do
  describe "On the discover page" do
    it "should have a button to discover top movies and a search bar", :vcr do
      visit "/"
      expect(page).to have_button("Find Top Rated Movies")
      expect(page).to have_field('Search by movie title')
      expect(page).to have_button("Find Movies")
    end

    it "when I click on Find Top Rated Movies I am taken to a page with top rated movies", :vcr do
      visit "/"
      click_button "Find Top Rated Movies"

      expect(current_path).to eq('/movies/top_rated')
      expect(page).to have_content("Title: Gabriel's Inferno Part II")
      expect(page).to have_content("Average Rating: 8.9")
    end
  end
end
