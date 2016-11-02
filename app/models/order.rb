class Order < ApplicationRecord
	enum status: { opened: 0, in_progress: 1, done: 2, delivered: 3, closed: 4, cancelled: 5 }

	validates :customer_id, presence: true
	validates :equipment_id, presence: true
	validates :defect, presence: true
	validates :status, presence: true

	def self.statuses_settings
    statuses.map do |status, key|
      [I18n.t("activerecord.attributes.#{model_name.i18n_key}.statuses.#{status}"), status, key]
		end
  end

	def created_at_date_for_json
		I18n.l self.created_at, format: "%d/%m/%Y"
	end

	def status_for_json
		I18n.t :"activerecord.attributes.#{model_name.i18n_key}.statuses.#{self.status}"
	end

	def customer
		customer = Customer.find(self.customer_id)
		customer.first_name + ' ' + customer.last_name + ' (' + customer.email + ')'
	end

	def equipment
		Equipment.find(self.equipment_id).specs
	end

	def as_json(options = {})
	  super options.merge(methods: [:customer, :equipment, :status_for_json, :created_at_date_for_json])
	end
end
