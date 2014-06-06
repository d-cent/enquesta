class Option < ActiveRecord::Base
  # relationships
  belongs_to :poll, inverse_of: :options
  has_many :votes, inverse_of: :option
  
  # scopes
  
  scope :by_position, -> { order('options.position ASC') }
  scope :alphabetically, -> { order('options.text ASC') }
  scope :by_votes, -> { order('options.votes_count DESC') }
  
  # validations
  validates :text, presence: true
  validate :cannot_be_created_after_poll_has_ended
  validates :position, uniqueness: { scope: :poll_id }

private
 
  def cannot_be_created_after_poll_has_ended
    errors.add(:poll_id, 'has already ended') if self.poll && self.poll.is_over?
  end
end
