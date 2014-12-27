class User < ActiveRecord::Base
  # Virtual attribute for the unencrypted password
  attr_accessor :password
  devise :database_authenticatable,
       :recoverable, :rememberable,  :validatable, 
       :encryptable #, :registerable
  validates_presence_of     :email
  validates_presence_of     :password,                   :if => :password_required?
  validates_presence_of     :password_confirmation,      :if => :password_required?
  validates_length_of       :password, :within => 4..40, :if => :password_required?
  validates_confirmation_of :password,                   :if => :password_required?
  validates_length_of       :email,    :within => 3..100
  validates_uniqueness_of   :login, :email, :case_sensitive => false

  
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  #attr_accessible :login, :realname, :email, :password, :password_confirmation, :remember_me

  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
 def self.authenticate(login, password)
    u = find_by_email(login) # need to get the salt
    u && u.valid_password?(password) ? u : nil
  end

  def valid_password?(password)
    return false if encrypted_password.blank?
    Devise.secure_compare(Devise::Encryptable::Encryptors::OldRestfulAuthentication.digest(password, 1, password_salt, ''), self.encrypted_password)
  end

end
