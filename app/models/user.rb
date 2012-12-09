class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :crypted_password, :email, :salt, :username, :password, :password_confirmation, :active, :skypename, :show_skype, :activation_state, :avatar, :optin, :bio
  has_attached_file :avatar, :styles => {
    :portrait => ["300x300#", :jpg],
  }, :url => "/uploads/avatars/:id/:style.:extension"

  #validatie
  validates_presence_of :username, :avatar
  validates_length_of :password, :minimum => 3, :message => "password must be at least 3 characters long", :if => :password
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password
  validates_uniqueness_of :email, :on => :create
  validates_uniqueness_of :username, :on => :create



  # has_many :posts
  has_many :ideas
  has_many :solutions
  has_many :rewards
  has_many :messages
  has_many :questions
  has_many :comments, :dependent => :destroy
  has_many :appreciables


end
