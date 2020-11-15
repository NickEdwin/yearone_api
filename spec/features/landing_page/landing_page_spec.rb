require "rails_helper"

RSpec.describe 'As any user' do
  describe "On the discover page" do
    it "should have a button to discover top movies and a search bar" do
      visit "/"
      expect(page).to have_button("Find Top Rated Movies")
      expect(page).to have_field('Search by movie title')
      expect(page).to have_button("Find Movies")
    end
  end
end
