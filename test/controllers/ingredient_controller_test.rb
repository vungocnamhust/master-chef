require 'test_helper'

class IngredientControllerTest < ActionDispatch::IntegrationTest
  test "should get delete" do
    get ingredient_delete_url
    assert_response :success
  end

end
