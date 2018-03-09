class Category < ApplicationRecord
  has_many :events

  validates :title, :color, presence: true
  validates :color, length: { is: 6 }

  def hex_code
    "#${color}".upcase
  end
end
