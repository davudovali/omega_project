class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :wallets, dependent: :destroy
  has_many :expenses, dependent: :destroy
	validates :name, length: {in: 1..25}, uniqueness: true, presence: true
	validates :email, uniqueness: true

end
