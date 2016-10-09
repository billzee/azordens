class Equipment < ApplicationRecord
  validates :description, presence: true
  validates :model, presence: true
  has_many :orders, dependent: :nullify

  def specs
    if self.brand_id.present?
      brand = Brand.find(self.brand_id).name
      self.description + ' ' + brand + ' ' + self.model
    else
      self.description + ' ' + self.model
    end
  end
end
