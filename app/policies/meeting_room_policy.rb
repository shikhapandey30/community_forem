class MeetingRoomPolicy < ApplicationPolicy
  attr_reader :user, :meeting_room

  def initialize(user, meeting_room)
    @user = user
    @meeting_room = meeting_room
  end

  def update?
    @user == @meeting_room.user
  end

  def destroy?
    @user == @meeting_room.user
  end

  def edit?
    update?
  end
end
