require "rails_helper"

RSpec.describe 'As any user' do
  describe "when searching for a movie" do
    it "can click on a movie title and go to its show page", :vcr do
      visit "/"
      click_button "Find Top Rated Movies"

      expect(page).to have_link("Gabriel's Inferno Part II")
      click_on("Gabriel's Inferno Part II")

      expect(current_path).to eq("/movies/724089")
    end

    it "shows a movies information", :vcr do
      visit "/"
      click_button "Find Top Rated Movies"

      expect(page).to have_link("Gabriel's Inferno Part II")
      click_on("Gabriel's Inferno Part II")

      expect(page).to have_content("Gabriel's Inferno Part II")
      expect(page).to have_content("Directed by: Tosca Musk")
      expect(page).to have_content("Released: 2020-07-31")
      expect(page).to have_content("Average Rating: 8.9")
      expect(page).to have_content("Romance")
      expect(page).to have_content("Melanie Zanetti as Julia Mitchell")
    end

    it "shows a movies reviews", :vcr do
      visit "/"
      click_button "Find Top Rated Movies"

      click_on("The Shawshank Redemption")

      expect(page).to have_content("very good movie 9.5/1")
    end
  end
end
