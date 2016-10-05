class Customer < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  has_many :orders, dependent: :nullify

  def full_name
    self.first_name + ' ' + self.last_name
  end
end
