require 'test_helper'

class ProdCotisControllerTest < ActionController::TestCase
  setup do
    @prod_coti = prod_cotis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prod_cotis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prod_coti" do
    assert_difference('ProdCoti.count') do
      post :create, prod_coti: { cod_cotiza: @prod_coti.cod_cotiza, cod_producto: @prod_coti.cod_producto }
    end

    assert_redirected_to prod_coti_path(assigns(:prod_coti))
  end

  test "should show prod_coti" do
    get :show, id: @prod_coti
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prod_coti
    assert_response :success
  end

  test "should update prod_coti" do
    patch :update, id: @prod_coti, prod_coti: { cod_cotiza: @prod_coti.cod_cotiza, cod_producto: @prod_coti.cod_producto }
    assert_redirected_to prod_coti_path(assigns(:prod_coti))
  end

  test "should destroy prod_coti" do
    assert_difference('ProdCoti.count', -1) do
      delete :destroy, id: @prod_coti
    end

    assert_redirected_to prod_cotis_path
  end
end
