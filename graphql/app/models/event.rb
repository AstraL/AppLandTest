class Event < ApplicationRecord
  has_one_attached :image
  
  validates :name, presence: true
  validates :start_date, presence: true
end