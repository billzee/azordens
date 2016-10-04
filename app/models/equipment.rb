class Equipment < ApplicationRecord
  validates :name, presence: true
  validates :model, presence: true
  has_one :brand, dependent: :nullify

end
