class User < ActiveRecord::Base
  include Gravtastic
  gravtastic :size => 100

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :facts
  has_many :fact_votes

  def can_vote_for?(fact)
    fact_votes.build(value: 1, fact: fact).valid? if fact_votes
  end

end
