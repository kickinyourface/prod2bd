require 'test_helper'

class ProdAlmasControllerTest < ActionController::TestCase
  setup do
    @prod_alma = prod_almas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prod_almas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prod_alma" do
    assert_difference('ProdAlma.count') do
      post :create, prod_alma: { cod_almacen: @prod_alma.cod_almacen, cod_producto: @prod_alma.cod_producto }
    end

    assert_redirected_to prod_alma_path(assigns(:prod_alma))
  end

  test "should show prod_alma" do
    get :show, id: @prod_alma
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prod_alma
    assert_response :success
  end

  test "should update prod_alma" do
    patch :update, id: @prod_alma, prod_alma: { cod_almacen: @prod_alma.cod_almacen, cod_producto: @prod_alma.cod_producto }
    assert_redirected_to prod_alma_path(assigns(:prod_alma))
  end

  test "should destroy prod_alma" do
    assert_difference('ProdAlma.count', -1) do
      delete :destroy, id: @prod_alma
    end

    assert_redirected_to prod_almas_path
  end
end
