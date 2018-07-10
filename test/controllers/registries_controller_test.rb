require 'test_helper'

class RegistriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get registries_index_url
    assert_response :success
  end

  test "should get create" do
    get registries_create_url
    assert_response :success
  end

  test "should get show" do
    get registries_show_url
    assert_response :success
  end

end
