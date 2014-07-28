class Transaction < ActiveRecord::Base
  belongs_to :wallet
	belongs_to :expense
	validates :summ, numericality: true
  validates :goal, length: {in: 1..100}

end
