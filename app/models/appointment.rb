class Appointment < ActiveRecord::Base
	belongs_to :wallet
	belongs_to :wallet_transaction
end
