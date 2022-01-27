require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "home link" do
    get root_path
    assert_template "home/top"
    assert_select "a[href=?]", root_path
  end 
end
