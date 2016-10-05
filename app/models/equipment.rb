class Equipment < ApplicationRecord
  validates :name, presence: true
  validates :model, presence: true
  has_many :orders, dependent: :nullify

  def specs
    if self.brand_id.present?
      brand = Brand.find(self.brand_id).name
      self.name + ' ' + brand + ' ' + self.model
    else
      self.name + ' ' + self.model
    end
  end
end
