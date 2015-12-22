require 'test_helper'

class MeetingRoomsControllerTest < ActionController::TestCase
  setup do
    @meeting_room = meeting_rooms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:meeting_rooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create meeting_room" do
    assert_difference('MeetingRoom.count') do
      post :create, meeting_room: { category_id: @meeting_room.category_id, headline: @meeting_room.headline, name: @meeting_room.name, slogan: @meeting_room.slogan, topic: @meeting_room.topic, user_id: @meeting_room.user_id }
    end

    assert_redirected_to meeting_room_path(assigns(:meeting_room))
  end

  test "should show meeting_room" do
    get :show, id: @meeting_room
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @meeting_room
    assert_response :success
  end

  test "should update meeting_room" do
    patch :update, id: @meeting_room, meeting_room: { category_id: @meeting_room.category_id, headline: @meeting_room.headline, name: @meeting_room.name, slogan: @meeting_room.slogan, topic: @meeting_room.topic, user_id: @meeting_room.user_id }
    assert_redirected_to meeting_room_path(assigns(:meeting_room))
  end

  test "should destroy meeting_room" do
    assert_difference('MeetingRoom.count', -1) do
      delete :destroy, id: @meeting_room
    end

    assert_redirected_to meeting_rooms_path
  end
end
