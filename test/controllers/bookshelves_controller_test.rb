require 'test_helper'

class BookshelvesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get bookshelves_new_url
    assert_response :success
  end

end
