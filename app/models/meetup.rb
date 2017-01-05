class Meetup < ActiveRecord::Base
  has_many :users,
  through: :attendees

  validates :time, presence: true
  validates :duration, presence: true
  validates :name, presence: true
  validates :location, presence: true
  validates :date, presence: true
  validates :description, presence: true
end
