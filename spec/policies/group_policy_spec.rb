require "rails_helper"

describe GroupPolicy do
  subject { described_class }

  permissions :update?, :edit?, :destroy? do
    it "denies access if group is not user" do
      expect(subject).not_to permit(FactoryGirl.create(:user),FactoryGirl.create(:group))
    end

     it "Grant access if group is user" do
      user = FactoryGirl.create(:user)
      expect(subject).to permit(user,Group.create(:topic => "new topic", :description => "new desciption", :category_id=> 1 ,:user_id => user.id))
    end
  end
end