class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  validates :body, presence: true
  validates :question_id, presence: true
  validates :user_id, presence: true

  after_create :send_answered_email

  def send_answered_email
    if self.question.user_id
      UserMailer.answered_email(User.find(self.question.user_id), self.question).deliver_now
    end
  end
end
