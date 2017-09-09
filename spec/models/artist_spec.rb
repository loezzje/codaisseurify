require 'rails_helper'


RSpec.describe Artist, type: :model do

  describe "validations" do

    it "is invalid without name" do
      artist = Artist.new(name:"")
      artist.valid?
      expect(artist.errors).to have_key(:name)
    end



    it "is invalid when name is not unique" do
      @artist1 = Artist.create!(name: "Name")
      @artist2 = Artist.create!(name: "Name")

      @artist1.valid?
      expect(@artist1.errors).to have_key(:name)
    end

  end
end



#
#
# RSpec.describe Event, type: :model do
#   describe "validations" do
#     it "is invalid without a description" do
#       event = Event.new(description:"")
#       event.valid?
#       expect(event.errors).to have_key(:description)
#     end
#
#     it "is invalid to have a description longer than 500 characters" do
#       event = Event.new(description: "L" * 501)
#       event.valid?
#       expect(event.errors).to have_key(:description)
#     end
#
#     it "is invalid to have no start time" do
#       event = Event.new(starts_at: "")
#       event.valid?
#       expect(event.errors).to have_key(:starts_at)
#     end
#
#     it "is invalid to have no end time" do
#       event = Event.new(ends_at: "")
#       event.valid?
#       expect(event.errors).to have_key(:ends_at)
#     end
#
#     # it "Is invalid with a starting time that is later than the end time" do
#     #       event = Event.new(starts_at: "4/9/2018 10:00", ends_at: "5/9/2017 10:00")
#     #
#     #       event.valid?
#     #       expect(event.errors).to have_key(:ends_at)
#     #     end
#
#     # it "is not possible to have an end time that is before the start time" do
#     #   event = Event.new(starts_at: "2018/01/01 15:00", ends_at: "2017/01/01 14:00")
#     #   event.valid?
#     #   expect(event.errors).to have_key(:end_time)
#     # end
#   end
#
#   describe "association with user" do
#     let(:user) { create :user }
#
#     it "belongs to a user" do
#       event = user.events.new
#
#       expect(event.user).to eq(user)
#     end
#   end
#
#   describe "association with category" do
#     let(:event) { create :event }
#
#     let(:category1) { create :category, name: "Hiking", events: [event] }
#     let(:category2) { create :category, name: "Eating", events: [event] }
#     let(:category3) { create :category, name: "Drinking", events: [event] }
#
#     it "has categories" do
#       expect(event.categories).to include(category1)
#       expect(event.categories).to include(category2)
#       expect(event.categories).to include(category3)
#     end
#   end
#
#   describe "association with registration" do
#     let(:participant) {create :user, email: "participant@user.com"}
#     let(:organiser) { create :user, email: "organiser@user.com"}
#
#     let!(:event) { create :event, user: organiser }
#     let!(:registration) {create :registration, event: event, user: participant }
#
#     it "has participants" do
#       expect(event.participants).to include(participant)
#     end
#   end
#
#
# end
