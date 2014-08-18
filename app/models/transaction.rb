class Transaction < ActiveRecord::Base
  belongs_to :wallet
	belongs_to :expense
	validates :summ, numericality: true
  validates :goal, length: {in: 1..100}

  after_save :calculate_summ

  protected
  def calculate_summ
  	self.wallet.summ -= self.summ
  	self.wallet.save
  end	

end
