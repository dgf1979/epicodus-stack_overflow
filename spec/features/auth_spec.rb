require 'rails_helper'

describe "authentication" do
  it "auths a user" do
    user = FactoryGirl.create(:user)
    visit log_in_path
    fill_in "Email", with: "josh@josh.net"
    fill_in "Password", with: "1234"
    click_on "Log in"
    expect(page).to have_content 'Sign Out'
  end

  it "fails to auth a user" do
    user = FactoryGirl.create(:user)
    visit log_in_path
    fill_in "Email", with: "josh@josh.net"
    fill_in "Password", with: "1"
    click_on "Log in"
    expect(page).to have_content 'Sign In'
  end

  it "logs out a user" do
    visit log_in_path
    fill_in "Email", with: "josh@josh.net"
    fill_in "Password", with: "1234"
    click_on "Log in"
    visit log_out_path
    expect(page).to have_content 'You have logged out'
  end
end
