class User < ActiveRecord::Base
   # Password
  has_secure_password

  attr_accessible :prefix, :optin, :password_reset, :last_name, :remember_token, :accepted, :email, :password, :password_confirmation, :first_name

   # Validation
  validates :email, :presence => true, :uniqueness => true
  validates_presence_of :password, :password_confirmation, :on => :create
  validates_presence_of :first_name, :on => :create
  validates_presence_of :last_name, :on => :create
  validates_length_of :password, :in => 6..20, :allow_blank => true
end
