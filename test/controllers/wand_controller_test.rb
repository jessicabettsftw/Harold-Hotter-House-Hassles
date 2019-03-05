require 'test_helper'

class WandControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get wand_new_url
    assert_response :success
  end

  test "should get edit" do
    get wand_edit_url
    assert_response :success
  end

end
