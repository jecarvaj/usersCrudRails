class User < ApplicationRecord
  has_secure_password
  has_attached_file :image, styles: { medium: '200x200', thumb: '100x100#' }, default_url:"http://www.fastpoke.com/wp-content/themes/wpjobus/images/User_default.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  #Relacion para un user tiene muchos profiles
  has_many :profiles, inverse_of: :user
  accepts_nested_attributes_for :profiles, reject_if: :all_blank, allow_destroy: true

  #Validaciones
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
    errors.add(:birthday, "Nacimiento futuro?") unless birthday <= Date.today
  end

  def funky_method
    "#{self.first_name+' '+ self.last_name+'--'+self.mail}"
  end
end
