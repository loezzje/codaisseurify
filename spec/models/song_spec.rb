require 'rails_helper'


RSpec.describe Song, type: :model do

  describe "validations" do
    it "is invalid without name" do
      song = Song.new(name:"")
      song.valid?
      expect(song.errors).to have_key(:name)
    end
    #if time add uniqueness to songs
  end

  describe "association with artist" do
    let(:artist) { create :artist }

    it "belongs to artist" do
      song = artist.songs.new

      expect(song.artist).to eq(artist)
    end
  end

end
