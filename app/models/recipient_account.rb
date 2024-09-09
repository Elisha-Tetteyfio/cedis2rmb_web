class RecipientAccount < ApplicationRecord
  belongs_to :account_type
  has_one_attached :qr_code
end
