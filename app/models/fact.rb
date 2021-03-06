class Fact < ActiveRecord::Base
  has_many :references, dependent: :destroy
  belongs_to :user
  has_many :fact_votes

  accepts_nested_attributes_for :user, :references, :allow_destroy => true

  validates :title, presence: true
  validates :description, presence: true
  validates :references, presence: true

  validates :title, length: {maximum: 140}, allow_blank: false

  def self.random # class model
    Fact.offset(rand(Fact.count)).first
    # TODO private facts should not be displayed
  end

  def votes
    read_attribute(:votes) || fact_votes.sum(:value)
  end

end
