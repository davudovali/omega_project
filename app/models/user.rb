class User < ActiveRecord::Base
	has_many :wallets, dependent: :destroy
  has_many :expenses, dependent: :destroy
	validates :name, length: {in: 1..25}, uniqueness: true, presence: true
	validates :email, uniqueness: true
	validates :password, length: {in: 6..30}

end
