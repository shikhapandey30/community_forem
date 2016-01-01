require "rails_helper"

describe MeetingRoomPolicy do
  subject { described_class }

  permissions :update?, :edit?, :destroy? do
    it "denies access if meeting_room is not user" do
      expect(subject).not_to permit(FactoryGirl.create(:user),FactoryGirl.create(:meeting_room))
    end

     it "Grant access if meeting_room is user" do
      user = FactoryGirl.create(:user)
      expect(subject).to permit(user,MeetingRoom.create(:topic => "new topic", :name => "new name", :slogan => "new slogan", :category_id=> 1 ,:user_id => user.id))
    end
  end
end