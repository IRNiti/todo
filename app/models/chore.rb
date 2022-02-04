class Chore < ApplicationRecord
  belongs_to :user, optional: true
  has_one :recurrence
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  attr_accessor :recurring, :start_date, :end_date, :repeat_interval
end
