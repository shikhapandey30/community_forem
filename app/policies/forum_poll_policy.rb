class ForumPollPolicy < ApplicationPolicy
  attr_reader :user, :forum_poll

  def initialize(user, forum_poll)
    @user = user
    @forum_poll = forum_poll
  end

  def update?
    @user == @forum_poll.user
  end

  def destroy?
    @user == @forum_poll.user
  end

  def edit?
    update?
  end
end
