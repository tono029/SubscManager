require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    # GETリクエストをhomeアクションに送る。
    get home_top_url
    # レスポンスは成功になるはず
    assert_response :success
  end


end
