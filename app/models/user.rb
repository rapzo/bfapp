# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  email         :string(255)
#  password_hash :string(255)
#  password_salt :string(255)
#  active        :boolean
#  locked        :boolean
#  client_id     :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class User < ActiveRecord::Base
  belongs_to :client

  attr_accessor :password

  before_save :encrypt_password

  validates_presence_of :password, :on => :create
  validates_presence_of :email, :message => "Enter a valid email."
  validates_uniqueness_of :email, :message => "That email is already in use."

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
