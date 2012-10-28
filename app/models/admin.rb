class Admin < ActiveRecord::Base
  # Password
  has_secure_password

  has_many :posts
  has_many :comments

  # Mass-assignment
  attr_accessible :username, :password, :password_confirmation

  # Validation
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 2..30 }
  validates_presence_of :password, :password_confirmation, :on => :create
  validates_length_of :password, :in => 6..20, :allow_blank => true


end
