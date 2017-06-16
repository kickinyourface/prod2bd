require 'test_helper'

class DocumentosControllerTest < ActionController::TestCase
  setup do
    @documento = documentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:documentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create documento" do
    assert_difference('Documento.count') do
      post :create, documento: { cod_pedido: @documento.cod_pedido, cod_tipdoc: @documento.cod_tipdoc, nom_documento: @documento.nom_documento, ruta_archivo: @documento.ruta_archivo }
    end

    assert_redirected_to documento_path(assigns(:documento))
  end

  test "should show documento" do
    get :show, id: @documento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @documento
    assert_response :success
  end

  test "should update documento" do
    patch :update, id: @documento, documento: { cod_pedido: @documento.cod_pedido, cod_tipdoc: @documento.cod_tipdoc, nom_documento: @documento.nom_documento, ruta_archivo: @documento.ruta_archivo }
    assert_redirected_to documento_path(assigns(:documento))
  end

  test "should destroy documento" do
    assert_difference('Documento.count', -1) do
      delete :destroy, id: @documento
    end

    assert_redirected_to documentos_path
  end
end
