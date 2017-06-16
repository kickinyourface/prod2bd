require 'test_helper'

class CotizacionsControllerTest < ActionController::TestCase
  setup do
    @cotizacion = cotizacions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cotizacions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cotizacion" do
    assert_difference('Cotizacion.count') do
      post :create, cotizacion: { canti_productos: @cotizacion.canti_productos, cod_cliente: @cotizacion.cod_cliente }
    end

    assert_redirected_to cotizacion_path(assigns(:cotizacion))
  end

  test "should show cotizacion" do
    get :show, id: @cotizacion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cotizacion
    assert_response :success
  end

  test "should update cotizacion" do
    patch :update, id: @cotizacion, cotizacion: { canti_productos: @cotizacion.canti_productos, cod_cliente: @cotizacion.cod_cliente }
    assert_redirected_to cotizacion_path(assigns(:cotizacion))
  end

  test "should destroy cotizacion" do
    assert_difference('Cotizacion.count', -1) do
      delete :destroy, id: @cotizacion
    end

    assert_redirected_to cotizacions_path
  end
end
