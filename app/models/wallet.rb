class Wallet < ActiveRecord::Base
  belongs_to :user
  has_many :transactions, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :wallet_transactions, :through => :appointments, dependent: :destroy
  validates :name, length: {in: 1..30}, presence: true
  validates :summ, numericality: true
  validates :currency, format: {with: /(USD|RUB|EUR|GBP)/}
  validates_associated :user
end
