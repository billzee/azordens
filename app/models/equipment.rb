class Equipment < ApplicationRecord
  validates :name, presence: true
  validates :model, presence: true
  validates :brand_id, presence: true
end
