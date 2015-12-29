class GroupPolicy < ApplicationPolicy
  attr_reader :user, :group

  def initialize(user, group)
    @user = user
    @group = group
  end

  def update?
    @user == @group.user
  end

  def destroy?
    @user == @group.user
  end

  def edit?
    update?
  end
end
