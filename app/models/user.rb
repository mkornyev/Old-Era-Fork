class User < ApplicationRecord
  # use has_secure_password for password hashing
  has_secure_password
  
  # validations
  validates :email, presence: true, uniqueness: { case_sensitive: true}
  validates :role, inclusion: { in: %w[admin sow reentrant], message: "is not a recognized role in system" }
  validates_presence_of :password, on: :create
  validates_presence_of :password_confirmation, on: :create
  validates_confirmation_of :password, message: "does not match"
  validates_length_of :password, minimum: 4, message: "must be at least 4 characters long", allow_blank: true
  # validates_format_of :phone, with: /\A\(?\d{3}\)?[-. ]?\d{3}[-.]?\d{4}\z/, message: "should be 10 digits (area code needed) and delimited with dashes or dots"
  # validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil))\z/i, message: "is not a valid format"

  ROLES = [['Admin', :admin],['sow', :sow],['reentrant', :reentrant]]
  before_save :reformat_phone


  def reentrant
    ReEntrant.find_by_user_id(self.id)
  end

  def outreachWorker
    OutreachWorker.find_by_user_id(self.id)
  end

  def role?(authorized_role)
    return false if role.nil?
    role.downcase.to_sym == authorized_role
  end

  # login by username
  def self.authenticate(email, password)
    find_by_email(email).try(:authenticate, password)
  end

  private
  def reformat_phone
    self.phone = self.phone.to_s.gsub(/[^0-9]/,"")
  end

end
