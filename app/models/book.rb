class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :price, presence: true, numericality: {
    greater_than_or_equal_to: 0
  }
  validates :pub_date, presence: true, comparison: {
    less_than_or_equal_to: Date.today
  }
end
