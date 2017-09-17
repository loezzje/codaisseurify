require 'rails_helper'

feature 'Manage songs', js: true do
  let(:artist1) {create :artist, id: 1}
  let(:song) {create :song, id: 1, artist_id: 1}
  scenario 'add a song' do
    visit artist_path(artist1)

    fill_in "song_name", with: "cool song"
     page.execute_script("$('form').submit()")

     expect(page).to have_content("cool song")

     scenario 'delete song' do
       visit artist_path(artist1)

       check('song-1')
       page.execute_script("$(#delete).click()")
       expect(page).to_not have_content(song)
     end

     scenario 'delete all songs' do
       visit visit artist_path(artist1)
       page.execute_script("$(#deleteall).click()")

       expect(page.find(:css, 'li#song-count').text ).to eq "0"
     end
  end


end
