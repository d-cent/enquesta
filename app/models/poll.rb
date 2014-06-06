class Poll < ActiveRecord::Base
  # relationships
  has_many :options, inverse_of: :poll
  has_many :votes, through: :options
  
  accepts_nested_attributes_for :options, reject_if: lambda { |a| a[:text].blank? }, allow_destroy: true
  
  # validations
  validates :prompt, presence: true
  
  # callbacks
  after_create :generate_hashed_id

  def to_param
    self.hashed_id
  end
  
  def self.find_securely(supposed_hash)
    where(hashed_id: supposed_hash).first if supposed_hash.present?
  end
  
  def is_over?
    self.ends_at.present? && (Time.zone.now > self.ends_at)
  end
  
  def winning_option
    self.options.to_a.sort_by { |o| o.votes.size }.reverse.first
  end
  
  def ends_in_hours
    TimeDifference.between(Time.zone.now, ends_at).in_hours
  end
  
  def ends_in_hours=(x)
    self.ends_at = Time.zone.now + (x.to_f * 60).to_i.minutes
  end

private
  
  def generate_hashed_id
    self.update_attributes(hashed_id: Digest::SHA1.hexdigest("--#{ Enquesta::Application.config.secret_key_base }--#{self.id}--"))
  end
end