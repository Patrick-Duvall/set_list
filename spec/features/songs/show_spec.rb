
#
# As a visitor
# When I visit /songs/1 (where 1 is the id of a song in my database)
# Then I see that song's title, and artist
# And I do not see any of the other songs in my database

require "rails_helper"

describe "As a visitor" do
    describe "when I visit a songs show page" do
      it "I see songs title and artist" do
        artist = Artist.create(name:"Queen")
        song_1 = artist.songs.create( title: "Don't stop believin'", length: 303, play_count: 22)
        song_2 = artist.songs.create( title: "Bohemian", length: 513, play_count: 28)

        visit "/songs/#{song_1.id}"

        expect(page).to have_content(song_1.title)
        expect(page).to have_content("By: #{song_1.artist.name}")
        expect(page).to_not have_content(song_2.title)

      end

    end
end
