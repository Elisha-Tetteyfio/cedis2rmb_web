class Order < ApplicationRecord
  belongs_to :user, optional: true

  STATUS = [['Pending', 'Pending'], ['Completed', 'Completed'], ['Cancelled', 'Cancelled']]

  def self.status_options
    STATUS
  end
end
