class ExchangeRate < ApplicationRecord
  belongs_to :user

  validates :value, presence: true, numericality: { greater_than: 0 }

  def self.current_rate
    order(created_at: :desc).first
  end
end
