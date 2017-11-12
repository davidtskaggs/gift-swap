class Event < ApplicationRecord
  validates :name, :description, :start_date, :end_date, :suggested_budget, :creator_id, presence: true

  belongs_to :creator, class_name: "User", foreign_key: :creator_id
  has_many :participations
  has_many :participants, through: :participations
  accepts_nested_attributes_for :participants






end
