class Poll < ActiveRecord::Base
  # relationships
  has_many :options
  
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

private
  
  def generate_hashed_id
    self.update_attributes(hashed_id: Digest::SHA1.hexdigest("--#{ Enquesta::Application.config.secret_key_base }--#{self.id}--"))
  end
end