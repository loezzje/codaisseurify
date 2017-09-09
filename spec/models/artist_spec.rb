require 'rails_helper'


RSpec.describe Artist, type: :model do

  describe "validations" do

    it "is invalid without name" do
      artist = Artist.new(name:"")
      artist.valid?
      expect(artist.errors).to have_key(:name)
    end

    it { is_expected.to validate_uniqueness_of(:name) }
    # I can't get the validation to work this way but I don't know why, therefore shouldamatchers
    # it "is invalid when name is not unique" do
    #   @artist1 = Artist.create!(name: "Name")
    #   @artist2 = Artist.create!(name: "Name")
    #
    #   @artist1.valid?
    #   expect(@artist1.errors).to have_key(:name)
    # end

  end

  describe "association with songs" do
    let(:artist) {create :artist }

    let!(:song1) { create :song, name: "Song1", artist: artist }
    let!(:song2) { create :song, name: "Song2", artist: artist }

    it "has many songs" do
      expect(artist.songs).to include(song1)
      expect(artist.songs).to include(song2)
    end

    it "deletes associated songs" do
      expect { artist.destroy }.to change(Song, :count).by(-2)
    end
  end

end
