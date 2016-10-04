class Brand < ApplicationRecord
  validates :name, presence: true
  has_many :equipments, dependent: :nullify
end
