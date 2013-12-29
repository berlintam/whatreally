class Fact < ActiveRecord::Base
  has_many :references, dependent: :destroy

  accepts_nested_attributes_for :references
end
