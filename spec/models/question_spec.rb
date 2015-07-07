require 'rails_helper'

describe Question do
  it { should validate_presence_of :title }
  it { should validate_presence_of :body }
  it { should have_many :answers}

  describe ".questions_today" do
    it "Will return an array of questions asked today" do
      question_0 = FactoryGirl.create(:question)
      question_1 = FactoryGirl.create(:question, title: "Things", body: "Stuff")
      question_2 = FactoryGirl.create(:question, title: "Other Things" , body: "Other stuff" , created_at: Date.new(2001, 1, 1))
      expect(Question.questions_today).to eq([question_0, question_1])
    end
  end

  describe "#send_new_question_email" do
    it "will send an email to a user when they successfully create a question" do
      user = FactoryGirl.create(:user)
      question = FactoryGirl.create(:question, user_id: user.id)
      expect(ActionMailer::Base.deliveries.last.to).to eq [user.email]
    end
  end
end
