require 'rails_helper'

def log_in
  user = FactoryGirl.create(:user)
  visit log_in_path
  fill_in "Email", with: "josh@josh.net"
  fill_in "Password", with: "1234"
  click_on "Log in"
end

describe "user management" do
  it "signs up a new user" do
    visit new_user_path
    fill_in "Name", with: "John"
    fill_in "Email", with: "john@place.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on 'Create User'
    expect(page).to have_content 'John'
  end

  it "fails to sign up a new user" do
    visit new_user_path
    fill_in "Name", with: ""
    fill_in "Email", with: "john@place.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on 'Create User'
    expect(page).to have_content 'error'
  end

  it "modifies a user" do
    user = FactoryGirl.create(:user)
    visit edit_user_path(user)
    fill_in "Name", with: "Ruby"
    click_on 'Update User'
    expect(page).to have_content 'Ruby'
  end

  it "fails to modify a user" do
    user = FactoryGirl.create(:user)
    visit edit_user_path(user)
    fill_in "Name", with: ""
    click_on 'Update User'
    expect(page).to have_content 'error'
  end

  it "destroys a user" do
    log_in
    visit users_path
    click_on "Destroy"
    expect(page).to_not have_content 'Josh'
  end
end
