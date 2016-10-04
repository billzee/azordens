class Equipment < ApplicationRecord
  validates :name, presence: true
  validates :model, presence: true
  validates :brand, presence: true
end
