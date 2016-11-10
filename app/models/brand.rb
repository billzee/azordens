class Brand < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :equipments, dependent: :nullify
  belongs_to :user

  def created_at_date_for_json
    I18n.l self.created_at, format: "%d/%m/%Y"
  end

  def as_json(options = {})
    super options.merge(methods: [:created_at_date_for_json])
  end
end
