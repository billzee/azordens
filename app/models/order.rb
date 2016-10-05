class Order < ApplicationRecord
	enum status: [ :open, :in_progress, :concluded, :delivered, :closed ]
	validates :defect, presence: true
end
