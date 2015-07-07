class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  validates :title, presence: true
  validates :body, presence: true

  scope :questions_today, -> {
    start_time = Time.new(Time.now.year, Time.now.month, Time.now.day).utc
    where("created_at < ? AND created_at > ?", Time.new.utc, start_time) 
  }

end
