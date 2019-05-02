require "rails_helper"

describe Song, type: :model do

  describe "relationships" do
    it { should belong_to :artist }
  end

  describe "class methods " do
    it '.song_count' do
      prince = Artist.create(name: 'Prince')
      talking = Artist.create(name: 'Talking')
      rasp = prince.songs.create(title: 'Rasperry Beret')
      wild = prince.songs.create(title: 'wild')

      expect(Song.song_count).to eq(2)
    end
  end

end
