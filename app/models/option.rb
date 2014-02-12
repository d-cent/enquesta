class Option < ActiveRecord::Base
  # relationships
  belongs_to :poll
  
  # validations
  validates :text, presence: true
end
