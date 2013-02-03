require 'test_helper'

class NoticesControllerTest < ActionController::TestCase
  setup do
    @notice = notices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create notice" do
    assert_difference('Notice.count') do
      post :create, notice: { company: @notice.company, edition: @notice.edition, edition_date: @notice.edition_date, id_number: @notice.id_number, name: @notice.name, no_of_appearance: @notice.no_of_appearance, page_no: @notice.page_no }
    end

    assert_redirected_to notice_path(assigns(:notice))
  end

  test "should show notice" do
    get :show, id: @notice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @notice
    assert_response :success
  end

  test "should update notice" do
    put :update, id: @notice, notice: { company: @notice.company, edition: @notice.edition, edition_date: @notice.edition_date, id_number: @notice.id_number, name: @notice.name, no_of_appearance: @notice.no_of_appearance, page_no: @notice.page_no }
    assert_redirected_to notice_path(assigns(:notice))
  end

  test "should destroy notice" do
    assert_difference('Notice.count', -1) do
      delete :destroy, id: @notice
    end

    assert_redirected_to notices_path
  end
end
