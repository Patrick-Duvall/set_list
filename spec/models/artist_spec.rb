require "rails_helper"

describe Artist, type: :model do

  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe "relationships" do
    it { should have_many :songs }

  end

  describe "instance methods " do
    it '.average_song_length' do
      prince = Artist.create(name: 'Prince')
      talking = Artist.create(name: 'Talking')
      she_was = talking.songs.create(title: 'she was', length: 234)
      wild = talking.songs.create(title: 'wild', length: 456)

      expect(talking.average_song_length).to eq(345)

    end
  end

end
