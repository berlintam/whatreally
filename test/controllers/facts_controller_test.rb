require 'test_helper'

class FactsControllerTest < ActionController::TestCase
  setup do
    @fact = facts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:facts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fact" do
    assert_difference('Fact.count') do
      post :create, fact: { description: @fact.description, title: @fact.title }
    end

    assert_redirected_to fact_path(assigns(:fact))
  end

  test "should show fact" do
    get :show, id: @fact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fact
    assert_response :success
  end

  test "should update fact" do
    patch :update, id: @fact, fact: { description: @fact.description, title: @fact.title }
    assert_redirected_to fact_path(assigns(:fact))
  end

  test "should destroy fact" do
    assert_difference('Fact.count', -1) do
      delete :destroy, id: @fact
    end

    assert_redirected_to facts_path
  end
end
