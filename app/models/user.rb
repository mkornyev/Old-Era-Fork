class User < ApplicationRecord
  # use has_secure_password for password hashing
  has_secure_password
  
  # validations
  validates :email, presence: true, uniqueness: { case_sensitive: true}
  validates :role, inclusion: { in: %w[admin instructor parent], message: "is not a recognized role in system" }
  validates_presence_of :password, on: :create
  validates_presence_of :password_confirmation, on: :create
  validates_confirmation_of :password, message: "does not match"
  validates_length_of :password, minimum: 4, message: "must be at least 4 characters long", allow_blank: true
  validates_format_of :phone, with: /\A\(?\d{3}\)?[-. ]?\d{3}[-.]?\d{4}\z/, message: "should be 10 digits (area code needed) and delimited with dashes or dots"
  validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil))\z/i, message: "is not a valid format"
end
