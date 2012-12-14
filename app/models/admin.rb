class Admin < ActiveRecord::Base
  # Password
  has_secure_password

  has_many :posts
  has_many :comments
  has_and_belongs_to_many :channels


  # Mass-assignment
  attr_accessible :username, :password, :password_confirmation, :channel_ids

  # Validation
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 2..30 }
  validates_presence_of :password, :password_confirmation, :on => :create
  validates_length_of :password, :in => 6..20, :allow_blank => true


end
