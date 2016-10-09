class Order < ApplicationRecord
	enum status: { open: 0, in_progress: 1, concluded: 2, delivered: 3, closed: 4 }

	validates :customer_id, presence: true
	validates :equipment_id, presence: true
	validates :defect, presence: true
	validates :status, presence: true

	def self.status_attributes_for_select
    statuses.map do |status, _|
      [I18n.t("activerecord.attributes.#{model_name.i18n_key}.statuses.#{status}"), status]
		end
  end
end
