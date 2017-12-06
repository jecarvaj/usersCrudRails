class User < ApplicationRecord
  has_secure_password
  before_save :capitalize_names
  validates :rut, :first_name, :last_name, :mail, presence: true
  validate :valid_date
  validates_format_of :mail, :with =>
      /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  def capitalize_names
    self.first_name=self.first_name.titleize
    self.last_name=self.last_name.titleize
  end

  def valid_date
    errors.add(:birthday, "Nacimiento en el futuro?") unless birthday < Date.today
  end
end
