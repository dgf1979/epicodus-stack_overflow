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
end
