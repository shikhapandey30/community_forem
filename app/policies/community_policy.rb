class CommunityPolicy < ApplicationPolicy
  attr_reader :user, :community

  def initialize(user, community)
    @user = user
    @community = community
  end

  def update?
    @user == @community.user
  end

  def destroy?
    @user == @community.user
  end

  def edit?
    update?
  end
end
