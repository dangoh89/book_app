require 'test_helper'

class BooklistControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get booklist_index_url
    assert_response :success
  end

end
