require 'rails_helper'

describe Answer do
  it { should validate_presence_of :question_id }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :body }

  describe "#send_answer_email" do
    it "will send an email to a question asker when an answer is posted" do
      user = FactoryGirl.create(:user)
      question = FactoryGirl.create(:question, user_id: user.id)
      answer = FactoryGirl.create(:answer, question_id: question.id, user_id: user.id)
      expect(ActionMailer::Base.deliveries.last.to).to eq [user.email]
    end
  end
end
