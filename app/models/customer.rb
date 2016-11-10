class Customer < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, email_format: { message: "deve ser válido" }
  has_many :orders, dependent: :nullify
  belongs_to :user

  def full_name
    self.first_name + ' ' + self.last_name
  end

  def created_at_date_for_json
    I18n.l self.created_at, format: "%d/%m/%Y"
  end

  def as_json(options = {})
    super options.merge(methods: [:created_at_date_for_json])
  end
end
