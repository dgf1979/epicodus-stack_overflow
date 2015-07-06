require 'rails_helper'


describe "question management" do
  before :each do
    user = FactoryGirl.create(:user)
    visit log_in_path
    fill_in "Email", with: "josh@josh.net"
    fill_in "Password", with: "1234"
    click_on "Log in"
  end

  it "adds a new question" do
    visit new_question_path
    fill_in "Title", with: "Stuff"
    fill_in "Question", with: "Things"
    click_on "Create Question"
    expect(page).to have_content 'successfully'
  end

  it "fails to add a new question" do
    visit new_question_path
    fill_in "Question", with: "Stuff"
    click_on "Create Question"
    expect(page).to have_content 'error'
  end

  it "edits a question" do
    question = FactoryGirl.create(:question)
    visit edit_question_path(question)
    fill_in "Title", with: "Stuff"
    fill_in "Question", with: "Other Stuff"
    click_on "Update Question"
    expect(page).to have_content 'Other Stuff'
  end

  it "fails to edit a question" do
    question = FactoryGirl.create(:question)
    visit edit_question_path(question)
    fill_in "Question", with: ""
    click_on "Update Question"
    expect(page).to have_content 'error'
  end

  it "destroys a question" do
    user = User.find_by(email: "josh@josh.net")
    question = FactoryGirl.create(:question, user_id: user.id)
    visit questions_path
    click_on "Destroy"
    expect(page).to_not have_content 'Stuff'
  end
end
