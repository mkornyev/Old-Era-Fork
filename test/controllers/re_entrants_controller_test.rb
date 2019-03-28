require 'test_helper'

class ReEntrantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @re_entrant = re_entrants(:one)
  end

  test "should get index" do
    get re_entrants_url
    assert_response :success
  end

  test "should get new" do
    get new_re_entrant_url
    assert_response :success
  end

  test "should create re_entrant" do
    assert_difference('ReEntrant.count') do
      post re_entrants_url, params: { re_entrant: { neighborhood: @re_entrant.neighborhood, user_id: @re_entrant.user_id } }
    end

    assert_redirected_to re_entrant_url(ReEntrant.last)
  end

  test "should show re_entrant" do
    get re_entrant_url(@re_entrant)
    assert_response :success
  end

  test "should get edit" do
    get edit_re_entrant_url(@re_entrant)
    assert_response :success
  end

  test "should update re_entrant" do
    patch re_entrant_url(@re_entrant), params: { re_entrant: { neighborhood: @re_entrant.neighborhood, user_id: @re_entrant.user_id } }
    assert_redirected_to re_entrant_url(@re_entrant)
  end

  test "should destroy re_entrant" do
    assert_difference('ReEntrant.count', -1) do
      delete re_entrant_url(@re_entrant)
    end

    assert_redirected_to re_entrants_url
  end
end
