require 'test_helper'

class Admins::PrefecturesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_prefectures_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_prefectures_show_url
    assert_response :success
  end

end
