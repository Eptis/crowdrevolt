class Admin < ActiveRecord::Base
  # Password
  has_secure_password

  has_many :posts
  has_many :comments
  has_and_belongs_to_many :channels


  # Mass-assignment
  attr_accessible :username, :password, :password_confirmation, :email, :skypename, :bio, :avatar, :channel_ids
  has_attached_file :avatar, :styles => {
    :portrait => ["300x300#", :jpg],
  }, :url => "/uploads/admin_avatars/:id/:style.:extension"

  # Validation
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 2..30 }
  validates_presence_of :avatar, :bio
  validates_presence_of :password, :password_confirmation, :on => :create
  validates_length_of :password, :in => 6..20, :allow_blank => true


end
