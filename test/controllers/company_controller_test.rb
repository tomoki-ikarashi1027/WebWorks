require 'test_helper'

class CompanyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get company_index_url
    assert_response :success
  end

  test "should get show" do
    get company_show_url
    assert_response :success
  end

  test "should get updata" do
    get company_updata_url
    assert_response :success
  end

  test "should get destroy" do
    get company_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get company_edit_url
    assert_response :success
  end

end
