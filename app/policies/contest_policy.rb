class ContestPolicy < ApplicationPolicy
  attr_reader :user, :contest

  def initialize(user, contest)
    @user = user
    @contest = contest
  end

  def update?
    @user == @contest.user
  end

  def destroy?
    @user == @contest.user
  end

  def edit?
    update?
  end
end
