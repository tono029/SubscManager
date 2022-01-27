require 'rails_helper'

RSpec.describe "Sub", type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    @user = User.create(
      email: "test@example.com",
      password: "testpass",
    )

    @sub = Sub.new(
      sub_name: "test_servise",
      fee: 1000,
      period: "/月",
      user_id: 1
    )
  end

  # ヴァリデーションが機能しているか
  it "is valid with sub_name, fee" do
    expect(@sub).to be_valid
  end


end
