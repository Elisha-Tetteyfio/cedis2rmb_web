class AdminAccount < ApplicationRecord
  belongs_to :user
  belongs_to :account_type
end
