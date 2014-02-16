class Option < ActiveRecord::Base
  # relationships
  belongs_to :poll
  has_many :votes
  
  # validations
  validates :text, presence: true
  validate :cannot_be_created_after_poll_has_ended

private
 
  def cannot_be_created_after_poll_has_ended
    errors.add(:poll_id, 'has already ended') if self.poll && self.poll.is_over?
  end
end
