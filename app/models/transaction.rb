class Transaction < ActiveRecord::Base
  require 'money'
  Money.default_bank = Money::Bank::GoogleCurrency.new
  require 'money/bank/google_currency'
  require 'json'
  MultiJson.engine = :json_gem # or :yajl
  belongs_to :wallet
	belongs_to :expense
	validates :summ, numericality: true
  validates :goal, length: {in: 1..100}
  validates :currency, presence: true

  scope :order_tr, ->(order) { order("created_at #{order}") } 

  after_save :calculate_summ

  protected
  def calculate_summ
  	self.wallet.summ = self.wallet.transactions.inject (0) { |summ, i|
      summ + i.summ.to_money(i.currency.to_sym).exchange_to(self.currency)
      }
  	self.wallet.save
        self.expense.summ = self.expense.transactions.inject (0){|summ, i|
      summ + i.summ }
    self.expense.save
  end	

end
