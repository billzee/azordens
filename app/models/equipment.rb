class Equipment < ApplicationRecord
  validates :description, presence: true
  validates :model, presence: true
  has_many :orders, dependent: :nullify

  def self.specs
    if self.brand_id.present?
      brand = Brand.find(self.brand_id).name
      self.description + ' ' + brand + ' ' + self.model
    else
      self.description + ' ' + self.model
    end
  end

  def created_at_date_for_json
    I18n.l self.created_at, format: "%d/%m/%Y"
  end

  def as_json(options = {})
    super options.merge(methods: [:created_at_date_for_json])
  end
end
