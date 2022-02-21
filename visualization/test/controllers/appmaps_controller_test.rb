require "test_helper"

class AppmapsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appmap = appmaps(:one)
  end

  test "should get index" do
    get appmaps_url
    assert_response :success
  end

  test "should get new" do
    get new_appmap_url
    assert_response :success
  end

  test "should create appmap" do
    assert_difference("Appmap.count") do
      post appmaps_url, params: { appmap: { path: @appmap.path } }
    end

    assert_redirected_to appmap_url(Appmap.last)
  end

  test "should show appmap" do
    get appmap_url(@appmap)
    assert_response :success
  end

  test "should get edit" do
    get edit_appmap_url(@appmap)
    assert_response :success
  end

  test "should update appmap" do
    patch appmap_url(@appmap), params: { appmap: { path: @appmap.path } }
    assert_redirected_to appmap_url(@appmap)
  end

  test "should destroy appmap" do
    assert_difference("Appmap.count", -1) do
      delete appmap_url(@appmap)
    end

    assert_redirected_to appmaps_url
  end
end
