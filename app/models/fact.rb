class Fact < ActiveRecord::Base
  has_many :references, dependent: :destroy
  belongs_to :user

  accepts_nested_attributes_for :user, :references, :allow_destroy => true

  validates :title, presence: true
  validates :description, presence: true

  validates :title, length: {maximum: 140}, allow_blank: false

end
