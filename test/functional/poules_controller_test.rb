require 'test_helper'

class PoulesControllerTest < ActionController::TestCase
  setup do
    @poule = poules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:poules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create poule" do
    assert_difference('Poule.count') do
      post :create, poule: { name: @poule.name, tournament_id: @poule.tournament_id }
    end

    assert_redirected_to poule_path(assigns(:poule))
  end

  test "should show poule" do
    get :show, id: @poule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @poule
    assert_response :success
  end

  test "should update poule" do
    put :update, id: @poule, poule: { name: @poule.name, tournament_id: @poule.tournament_id }
    assert_redirected_to poule_path(assigns(:poule))
  end

  test "should destroy poule" do
    assert_difference('Poule.count', -1) do
      delete :destroy, id: @poule
    end

    assert_redirected_to poules_path
  end
end
