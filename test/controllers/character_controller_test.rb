require 'test_helper'

class CharacterControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get character_show_url
    assert_response :success
  end

  test "should get new" do
    get character_new_url
    assert_response :success
  end

  test "should get edit" do
    get character_edit_url
    assert_response :success
  end

end
