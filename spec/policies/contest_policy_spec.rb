require "rails_helper"

describe ContestPolicy do
  subject { described_class }

  permissions :update?, :edit?, :destroy? do
    it "denies access if contest is not user" do
      expect(subject).not_to permit(FactoryGirl.create(:user),FactoryGirl.create(:contest))
    end

     it "Grant access if contest is user" do
      user = FactoryGirl.create(:user)
      expect(subject).to permit(user,Contest.create(:topic => "new topic", :description => "new desciption", :category_id=> 1 ,:user_id => user.id))
    end
  end
end