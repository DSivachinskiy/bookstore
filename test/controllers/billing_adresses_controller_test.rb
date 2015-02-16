require 'test_helper'

class BillingAdressesControllerTest < ActionController::TestCase
  setup do
    @billing_adress = billing_adresses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:billing_adresses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create billing_adress" do
    assert_difference('BillingAdress.count') do
      post :create, billing_adress: { adress: @billing_adress.adress, city: @billing_adress.city, country: @billing_adress.country, phone: @billing_adress.phone, zipcode: @billing_adress.zipcode }
    end

    assert_redirected_to billing_adress_path(assigns(:billing_adress))
  end

  test "should show billing_adress" do
    get :show, id: @billing_adress
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @billing_adress
    assert_response :success
  end

  test "should update billing_adress" do
    patch :update, id: @billing_adress, billing_adress: { adress: @billing_adress.adress, city: @billing_adress.city, country: @billing_adress.country, phone: @billing_adress.phone, zipcode: @billing_adress.zipcode }
    assert_redirected_to billing_adress_path(assigns(:billing_adress))
  end

  test "should destroy billing_adress" do
    assert_difference('BillingAdress.count', -1) do
      delete :destroy, id: @billing_adress
    end

    assert_redirected_to billing_adresses_path
  end
end
