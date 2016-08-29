class Order < ApplicationRecord
	enum status: [ :open, :in_progress, :concluded, :delivered, :closed ]
end
