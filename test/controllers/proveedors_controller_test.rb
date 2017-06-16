require 'test_helper'

class ProveedorsControllerTest < ActionController::TestCase
  setup do
    @proveedor = proveedors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:proveedors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proveedor" do
    assert_difference('Proveedor.count') do
      post :create, proveedor: { cod_prov: @proveedor.cod_prov, dir_prov: @proveedor.dir_prov, nom_prov: @proveedor.nom_prov, tel_prov: @proveedor.tel_prov }
    end

    assert_redirected_to proveedor_path(assigns(:proveedor))
  end

  test "should show proveedor" do
    get :show, id: @proveedor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @proveedor
    assert_response :success
  end

  test "should update proveedor" do
    patch :update, id: @proveedor, proveedor: { cod_prov: @proveedor.cod_prov, dir_prov: @proveedor.dir_prov, nom_prov: @proveedor.nom_prov, tel_prov: @proveedor.tel_prov }
    assert_redirected_to proveedor_path(assigns(:proveedor))
  end

  test "should destroy proveedor" do
    assert_difference('Proveedor.count', -1) do
      delete :destroy, id: @proveedor
    end

    assert_redirected_to proveedors_path
  end
end
