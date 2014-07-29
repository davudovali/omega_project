class WalletTransaction < ActiveRecord::Base
	has_many :appointments
	has_many :wallets, :through => :appointments
	validates :summ, numericality: true
end
