class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :recipient_account
  belongs_to :payer_account

  accepts_nested_attributes_for :payer_account
  accepts_nested_attributes_for :recipient_account

  STATUS = [['Pending', 'Pending'], ['Completed', 'Completed'], ['Cancelled', 'Cancelled']]

  def self.status_options
    STATUS
  end
end
