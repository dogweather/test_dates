class User < ApplicationRecord
  validates :name, :birthdate, :breakfast_time, :party_time, :interview_time, presence: true, allow_blank: false
end
