class Vote < ActiveRecord::Base
  belongs_to :option
  
  validates :option_id, presence: true
  validate :cannot_be_created_after_poll_has_ended

private
 
  def cannot_be_created_after_poll_has_ended
    errors.add(:option_id, 'has already ended') if self.option && self.option.poll && self.option.poll.is_over?
  end
end
