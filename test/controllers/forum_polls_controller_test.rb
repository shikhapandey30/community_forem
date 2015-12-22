require 'test_helper'

class ForumPollsControllerTest < ActionController::TestCase
  setup do
    @forum_poll = forum_polls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:forum_polls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create forum_poll" do
    assert_difference('ForumPoll.count') do
      post :create, forum_poll: { body: @forum_poll.body, category_id: @forum_poll.category_id, end_date: @forum_poll.end_date, start_date: @forum_poll.start_date, topic: @forum_poll.topic, visibility: @forum_poll.visibility }
    end

    assert_redirected_to forum_poll_path(assigns(:forum_poll))
  end

  test "should show forum_poll" do
    get :show, id: @forum_poll
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @forum_poll
    assert_response :success
  end

  test "should update forum_poll" do
    patch :update, id: @forum_poll, forum_poll: { body: @forum_poll.body, category_id: @forum_poll.category_id, end_date: @forum_poll.end_date, start_date: @forum_poll.start_date, topic: @forum_poll.topic, visibility: @forum_poll.visibility }
    assert_redirected_to forum_poll_path(assigns(:forum_poll))
  end

  test "should destroy forum_poll" do
    assert_difference('ForumPoll.count', -1) do
      delete :destroy, id: @forum_poll
    end

    assert_redirected_to forum_polls_path
  end
end
