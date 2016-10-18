class Order < ApplicationRecord
	enum status: { opened: 0, in_progress: 1, done: 2, delivered: 3, closed: 4, cancelled: 5 }

	validates :customer_id, presence: true
	validates :equipment_id, presence: true
	validates :defect, presence: true
	validates :status, presence: true

	def self.status_attributes_for_select
    statuses.map do |status, _|
      [I18n.t("activerecord.attributes.#{model_name.i18n_key}.statuses.#{status}"), status]
		end
  end

	def customer
		customer = Customer.find(self.customer_id)
		customer.first_name + ' ' + customer.last_name
	end

	def equipment
		Equipment.find(self.equipment_id).description
	end

	def as_json(options = {})
	  super options.merge(methods: [:customer, :equipment])
	end

end
