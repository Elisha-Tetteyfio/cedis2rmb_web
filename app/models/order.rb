class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :recipient_account
  belongs_to :payer_account

  accepts_nested_attributes_for :payer_account
  accepts_nested_attributes_for :recipient_account

  before_create :set_order_code

  STATUS = [['Pending', 'Pending'], ['Cancel', 'Cancelled']]

  def self.status_options
    STATUS
  end

  private

  def set_order_code
    loop do
      self.order_code = format('%06d', rand(0..999999))
      break unless Order.exists?(order_code: order_code)
    end
  end
end
