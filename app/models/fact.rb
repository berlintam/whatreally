class Fact < ActiveRecord::Base
  has_many :references, dependent: :destroy

  accepts_nested_attributes_for :references

  validates :title, presence: true
  validates :description, presence: true
end
