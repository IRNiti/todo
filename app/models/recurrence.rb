class Recurrence < ApplicationRecord
    has_many :chores, dependent: :destroy
end
