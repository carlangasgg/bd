require 'test_helper'

class TropasControllerTest < ActionController::TestCase
  setup do
    @tropa = tropas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tropas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tropa" do
    assert_difference('Tropa.count') do
      post :create, tropa: { ataque: @tropa.ataque, costo: @tropa.costo, defensa: @tropa.defensa, historia: @tropa.historia, nombre: @tropa.nombre, num_guerreros: @tropa.num_guerreros }
    end

    assert_redirected_to tropa_path(assigns(:tropa))
  end

  test "should show tropa" do
    get :show, id: @tropa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tropa
    assert_response :success
  end

  test "should update tropa" do
    patch :update, id: @tropa, tropa: { ataque: @tropa.ataque, costo: @tropa.costo, defensa: @tropa.defensa, historia: @tropa.historia, nombre: @tropa.nombre, num_guerreros: @tropa.num_guerreros }
    assert_redirected_to tropa_path(assigns(:tropa))
  end

  test "should destroy tropa" do
    assert_difference('Tropa.count', -1) do
      delete :destroy, id: @tropa
    end

    assert_redirected_to tropas_path
  end
end
