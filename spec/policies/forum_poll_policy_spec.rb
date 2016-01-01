require "rails_helper"

describe ForumPollPolicy do
  subject { described_class }

  permissions :update?, :edit?, :destroy? do
    it "denies access if forum_poll is not user" do
      expect(subject).not_to permit(FactoryGirl.create(:user),FactoryGirl.create(:forum_poll))
    end

     it "Grant access if forum_poll is user" do
      user = FactoryGirl.create(:user)
      expect(subject).to permit(user,ForumPoll.create(:topic => "new topic", :body => "new desciption", :category_id=> 1 ,:user_id => user.id))
    end
  end
end