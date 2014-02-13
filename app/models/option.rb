class Option < ActiveRecord::Base
  # relationships
  belongs_to :poll
  has_many :votes
  
  # validations
  validates :text, presence: true
end
