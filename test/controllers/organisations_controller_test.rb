require 'test_helper'

class OrganisationsControllerTest < ActionController::TestCase
  setup do
    @organisation = organisations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:organisations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create organisation" do
    assert_difference('Organisation.count') do
      post :create, organisation: { current_company: @organisation.current_company, designation: @organisation.designation, employment_detail_id: @organisation.employment_detail_id, end_date: @organisation.end_date, job_profile: @organisation.job_profile, start_date: @organisation.start_date }
    end

    assert_redirected_to organisation_path(assigns(:organisation))
  end

  test "should show organisation" do
    get :show, id: @organisation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @organisation
    assert_response :success
  end

  test "should update organisation" do
    patch :update, id: @organisation, organisation: { current_company: @organisation.current_company, designation: @organisation.designation, employment_detail_id: @organisation.employment_detail_id, end_date: @organisation.end_date, job_profile: @organisation.job_profile, start_date: @organisation.start_date }
    assert_redirected_to organisation_path(assigns(:organisation))
  end

  test "should destroy organisation" do
    assert_difference('Organisation.count', -1) do
      delete :destroy, id: @organisation
    end

    assert_redirected_to organisations_path
  end
end
