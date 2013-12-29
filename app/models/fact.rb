class Fact < ActiveRecord::Base
  has_many :references

  accepts_nested_attributes_for :references
end
