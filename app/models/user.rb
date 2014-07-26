class User < ActiveRecord::Base
	has_many :wallets
	validates :name, length: {in: 3..16}, uniqueness: true
	validates :email, uniqueness: true
	validates :password, length: {in: 6..20}

end
