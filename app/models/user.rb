class User < ApplicationRecord
  has_secure_password
  before_save :capitalize_names
  validates :rut, :first_name, :last_name, :mail, presence: true
  validate :valid_date
  validates_format_of :mail, :with =>
      /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  has_attached_file :image, styles: { medium: '200x200', thumb: '100x100#' }, default_url:"http://www.fastpoke.com/wp-content/themes/wpjobus/images/User_default.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def capitalize_names
    self.first_name=self.first_name.titleize
    self.last_name=self.last_name.titleize
  end

  def valid_date
    errors.add(:birthday, "Nacimiento en el futuro?") unless birthday <= Date.today
  end
end
