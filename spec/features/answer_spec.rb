require 'rails_helper'

describe "answer management" do
  question = nil
  user = nil

  before :each do
    user = FactoryGirl.create(:user)
    visit log_in_path
    fill_in "Email", with: "josh@josh.net"
    fill_in "Password", with: "1234"
    click_on "Log in"
    question = FactoryGirl.create(:question, user_id: user.id)
  end

  it "adds a new answer to a question" do
    visit new_question_answer_path(question)
    fill_in "Answer", with: "Stuff"
    click_on "Create Answer"
    expect(page).to have_content 'successfully'
  end

  it "fails to add a new answer" do
    visit new_question_answer_path(question)
    fill_in "Answer", with: ""
    click_on "Create Answer"
    expect(page).to have_content 'error'
  end

  it "edits a answer" do
    answer= FactoryGirl.create(:answer, question_id: question.id, user_id: user.id)
    visit edit_question_answer_path(question, answer)
    fill_in "Answer", with: "Things"
    click_on "Update Answer"
    expect(page).to have_content 'successfully'
  end

  it "fails to edit an answer" do
    answer= FactoryGirl.create(:answer, question_id: question.id, user_id: user.id)
    visit edit_question_answer_path(question, answer)
    fill_in "Answer", with: ""
    click_on "Update Answer"
    expect(page).to have_content 'error'
  end

  it "destroys an answer" do
    answer= FactoryGirl.create(:answer, question_id: question.id, user_id: user.id)
    visit question_path(question)
    click_on "Destroy"
    expect(page).to_not have_content 'because'
  end

end
