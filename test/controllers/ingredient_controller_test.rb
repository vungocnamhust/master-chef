require 'test_helper'

class IngredientControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get ingredient_destroy_url
    assert_response :success
  end

end
