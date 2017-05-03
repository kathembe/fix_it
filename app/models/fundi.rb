class Fundi < ActiveRecord::Base
  has_attached_file :image, styles: { large: "600x600>", medium: "400x400>", thumb: "100x100#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  acts_as_votable
  belongs_to :skill
  belongs_to :user
  has_many :reviews
    validates :first_name, :presence => true
    validates :surname, :presence => true
    validates :location, :presence => true
    validates :contacts, :presence => true
    validates :about, :presence => true
end
