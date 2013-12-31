class Reference < ActiveRecord::Base
  belongs_to :fact

  validates :ref, presence: true
end
