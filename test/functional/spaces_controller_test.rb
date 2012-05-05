require 'test_helper'

class SpacesControllerTest < ActionController::TestCase
  setup do
    @space = spaces(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spaces)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create space" do
    assert_difference('Space.count') do
      post :create, space: { about: @space.about, availability: @space.availability, capacity: @space.capacity, description: @space.description, equipment: @space.equipment, hourly_pricing: @space.hourly_pricing, location: @space.location, name: @space.name, rooms: @space.rooms, size: @space.size }
    end

    assert_redirected_to space_path(assigns(:space))
  end

  test "should show space" do
    get :show, id: @space
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @space
    assert_response :success
  end

  test "should update space" do
    put :update, id: @space, space: { about: @space.about, availability: @space.availability, capacity: @space.capacity, description: @space.description, equipment: @space.equipment, hourly_pricing: @space.hourly_pricing, location: @space.location, name: @space.name, rooms: @space.rooms, size: @space.size }
    assert_redirected_to space_path(assigns(:space))
  end

  test "should destroy space" do
    assert_difference('Space.count', -1) do
      delete :destroy, id: @space
    end

    assert_redirected_to spaces_path
  end
end
