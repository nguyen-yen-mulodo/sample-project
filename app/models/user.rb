class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation,:remember_me
  #attr_accessor :password
  before_save :encrypt_password
  after_save :clear_password
  before_save { self.email = email.downcase }
    
  #attr_accessor :password, :password_confirmation 
  #validate :valid_password 
    
#   validates :name, :email , :presence=>true 
#  # validates :name, presence: true, length: { maximum: 50 }
#   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
#   validates :email, presence: true,
#                     format: { with: VALID_EMAIL_REGEX },
#                     uniqueness: { case_sensitive: false }
#   #has_secure_password
#   validates :password, length: { minimum: 6 }
#  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i} 
    
       
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :name, :presence => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true, :format =>  EMAIL_REGEX
 # validates :password, :presence => true, :confirmation => true #password_confirmation attr
#  validates_confirmation_of :password
  validates_length_of :password, :in => 6..20, :on => :create
  #validates :password_confirmation, :presence => true
  
  #validates :password_confirmation, :presence => false, :allow_blank => true
  validates_presence_of :password_confirmation, :if => :password_present?
  validates_confirmation_of :password, :if => :password_present?
  
  def password_present?
    !password.nil?
  end
  
  
  def valid_password
      if password.blank? || password_confirmation.blank?
        errors.add(:password, 'password must not be blank')
      end
  
      if password != password_confirmation
        errors.add(:password, 'password and confirmation does not match')
      end
   end
  
 
  def encrypt_password
      if password.present?
        require 'digest/md5'
        self.password = Digest::MD5.hexdigest(self.password)
      end
   end
    
   def clear_password
     self.password = nil
   end
  
  def User.authenticate email, password 
      require 'digest/md5'
      encrypted_password= Digest::MD5.hexdigest(password)
      if user = User.find_by_email(email)
        if encrypted_password == user.password
          user
        end
      end
  end
  
end