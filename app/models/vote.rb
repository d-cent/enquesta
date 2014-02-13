class Vote < ActiveRecord::Base
  belongs_to :option
  
  validates :option_id, presence: true
end
