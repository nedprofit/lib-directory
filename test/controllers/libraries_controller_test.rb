require "test_helper"

class LibrariesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get libraries_create_url
    assert_response :success
  end
end
