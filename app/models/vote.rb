class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :poll
  has_one :event, through: :poll
  after_create :update_stats_poll

  validates :user_id, uniqueness: { scope: :poll_id}

  private
  def update_stats_poll
    ec = self.poll
    ec.currentAnswers += 1
    if ec.currentAnswers.to_i >= ec.minimumAnswers.to_i
      x = self.event
      x.start_date = Vote.select(:answerDate).group(:answerDate).order("count_id desc").count("id").first[0]
      x.save!
      ec.destroy!
    end
  end
end
