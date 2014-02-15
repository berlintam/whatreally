class FactVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :fact

  validates_uniqueness_of :fact_id, scope: :user_id
  validates_inclusion_of :value, in: [1, -1]
  validate :ensure_not_author

  def ensure_not_author
    errors.add :user_id, "is the author of the fact" if fact.user_id == user_id
  end
end
