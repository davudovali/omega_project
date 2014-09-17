class Transaction < ActiveRecord::Base
  Money.default_bank = Money::Bank::GoogleCurrency.new
  MultiJson.engine = :json_gem # or :yajl
  belongs_to :wallet
	belongs_to :expense
	validates :summ, numericality: true
  validates :goal, length: {in: 1..100}
  validates :currency, presence: true

  scope :order_tr, ->(order) { order("created_at #{order}") } 


end
