require "rails_helper"

describe "songs index page", type: :feature do
  it 'shows all songs' do
    artist = Artist.create(name: "Queen")
    song_1 = artist.songs.create( title: "Don't stop believin'", length: 303, play_count: 22)
    song_2 = artist.songs.create( title: "Bohemian", length: 513, play_count: 28)

    visit '/songs'

    expect(page).to have_content(song_1.title)
    expect(page).to have_content("Play Count: #{song_1.play_count}")
    expect(page).to have_content(song_2.title)
    expect(page).to have_content("Play Count: #{song_2.play_count}")
  end

  it "has links fo show song pages" do
    artist = Artist.create(name: "Queen")
    song_1 = artist.songs.create( title: "Don't stop believin'", length: 303, play_count: 22)
    song_2 = artist.songs.create( title: "Bohemian", length: 513, play_count: 28)

    visit '/songs'

    click_link song_1.title

    expect(current_path).to eq("/songs/#{song_1.id}")

  end
end
