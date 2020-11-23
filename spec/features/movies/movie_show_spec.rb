require 'rails_helper'

RSpec.describe 'As any user' do
  describe 'when searching for a movie' do
    it 'can click on a movie title and go to its show page', :vcr do
      visit '/'
      click_button 'Find Top Rated Movies'

      expect(page).to have_link("Gabriel's Inferno Part II")
      click_on("Gabriel's Inferno Part II")

      expect(current_path).to eq('/movies/724089')
    end

    it 'shows a movies information', :vcr do
      visit '/'
      click_button 'Find Top Rated Movies'

      expect(page).to have_link("Gabriel's Inferno Part II")
      click_on("Gabriel's Inferno Part II")

      expect(page).to have_content("Gabriel's Inferno Part II")
      expect(page).to have_content('Directed by: Tosca Musk')
      expect(page).to have_content('Released: 2020-07-31')
      expect(page).to have_content('Average MovieDB Rating: 8.9')
      expect(page).to have_content('Romance')
      expect(page).to have_content('Melanie Zanetti as Julia Mitchell')
      expect(page).to have_content('Have you seen this movie? If so click the emoji to vote!')
      expect(page).to have_css('.poster')
      expect(page).to have_button('thumbs up')
      expect(page).to have_button('thumbs down')
    end

    it 'shows a movies reviews', :vcr do
      visit '/'
      click_button 'Find Top Rated Movies'

      click_on('The Shawshank Redemption')

      expect(page).to have_content('very good movie 9.5/1')
    end

    it 'can vote on a movie', :vcr do
      Vote.create!(movie_title: 'The Shawshank Redemption', thumbs_up: 0, thumbs_down: 0)

      visit '/'
      click_button 'Find Top Rated Movies'

      click_on('The Shawshank Redemption')

      click_on('thumbs up')
      expect(current_path).to eq('/movies/278')
      expect(page).to have_content('1 thumbs up')
      expect(page).to have_content('0 thumbs down')

      click_on('thumbs up')
      click_on('thumbs down')
      expect(page).to have_content('2 thumbs up')
      expect(page).to have_content('1 thumbs down')
    end
  end
end
