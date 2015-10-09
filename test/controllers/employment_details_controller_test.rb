require 'test_helper'

class EmploymentDetailsControllerTest < ActionController::TestCase
  setup do
    @employment_detail = employment_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employment_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employment_detail" do
    assert_difference('EmploymentDetail.count') do
      post :create, employment_detail: { total_experience: @employment_detail.total_experience, user_id: @employment_detail.user_id }
    end

    assert_redirected_to employment_detail_path(assigns(:employment_detail))
  end

  test "should show employment_detail" do
    get :show, id: @employment_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employment_detail
    assert_response :success
  end

  test "should update employment_detail" do
    patch :update, id: @employment_detail, employment_detail: { total_experience: @employment_detail.total_experience, user_id: @employment_detail.user_id }
    assert_redirected_to employment_detail_path(assigns(:employment_detail))
  end

  test "should destroy employment_detail" do
    assert_difference('EmploymentDetail.count', -1) do
      delete :destroy, id: @employment_detail
    end

    assert_redirected_to employment_details_path
  end
end
