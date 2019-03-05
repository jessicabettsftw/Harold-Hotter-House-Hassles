require 'test_helper'

class SpellControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get spell_index_url
    assert_response :success
  end

  test "should get show" do
    get spell_show_url
    assert_response :success
  end

end
