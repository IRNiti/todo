class Chore < ApplicationRecord
  belongs_to :user, optional: true
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
end
