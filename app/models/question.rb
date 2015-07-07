class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  validates :title, presence: true
  validates :body, presence: true

  after_create :send_new_question_email

  scope :questions_today, -> {
    start_time = Time.new(Time.now.year, Time.now.month, Time.now.day).utc
    where("created_at < ? AND created_at > ?", Time.new.utc, start_time)
  }

  def send_new_question_email
    if self.user_id
      UserMailer.new_question_email(User.find(self.user_id), self).deliver_now
    end
  end
end
