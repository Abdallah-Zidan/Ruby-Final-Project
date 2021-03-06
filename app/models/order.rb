class Order < ApplicationRecord
	belongs_to :user
	has_many :order_product
	has_many :products, through: :order_product

	validates :address, :city, :phone, presence: true
	validates :status, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 2 }
	# validates_associated :user

	enum statuses: { pending: 0, confirmed: 1, delivered: 2 }

	def get_status
		Order.statuses.key(self.status)
	end
end