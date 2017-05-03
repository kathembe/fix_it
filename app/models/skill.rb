class Skill < ActiveRecord::Base
  has_many :fundis
  belongs_to :user
  validates :name, :presence => true
end
