class Manager < ActiveRecord::Base
  attr_accessor :password

  before_save :encrypt_password

  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  def self.authenticate(email, password)
    user = self.where(email: email)
    puts user.empty?
    if !user.empty?
      if user.password == BCrypt::Engine.hash_secret(password, user.password_salt)
        user
      end
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def activate
    self.active = true
    self.save
  end

end
