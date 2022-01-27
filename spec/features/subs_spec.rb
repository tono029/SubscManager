require 'rails_helper'

RSpec.feature "Subs", type: :feature do
  # pending "add some scenarios (or delete) #{__FILE__}"

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

    @subs = Sub.where(user_id: 1)
  end

  scenario "new registration and redirect to home" do
    visit "users/sign_up"

    fill_in "user[email]", with: "test@example.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_button "登録する"
    expect(current_path).to eq "/users"
  end

  scenario "user creates a new sub" do
    # トップページにアクセス
    visit root_path

    # ログインページに遷移
    click_link "ログイン"
    # フォームを埋める
    fill_in "user[email]", with: @user.email
    fill_in "user[password]", with: @user.password
    click_button "ログイン"

    # expect {実行内容}.to 結果
    expect {
      click_link "サブスク登録"
      fill_in "サービス名", with: @sub.sub_name
      fill_in "料金", with: @sub.fee
      click_button "追加"
    }.to change(@subs, :count).by(1)
  end
end
