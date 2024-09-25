class AccountType < ApplicationRecord
  def self.cedi_accounts
    where(currency: "Cedis")
  end

  def self.rmb_accounts
    where(currency: "RMB")
  end
end