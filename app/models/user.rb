# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  password   :string(255)
#  active     :boolean          default(FALSE)
#  locked     :boolean          default(FALSE)
#  client_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  attr_accessor :password

  before_save :encrypt

  validates_presence_of :password, :on => :create
  validates_presence_of :email, :message => "Enter a valid email."
  validates_uniqueness_of :email, :message => "That email is already in use."
  validates_uniqueness_of :client_id, :message => "Client already associated with user."

  def self.authenticate(user)
    u = User.find_by(email: user[:email])
    return nil if u.nil?
    

    client = ApiClient.find(u.client_id)
    return nil if !client
    salt = u.password_salt

    p "UID #{u.id} UCID #{u.client_id} CID #{salt} #{user[:password]}"

    return u if u.password_hash == Digest::SHA1.hexdigest("#{salt}#{user[:password]}")
  end

  def encrypt
    puts "SALT #{self.password_salt} PASSWOWRD #{self.password}"
    self.password_hash = Digest::SHA1.hexdigest("#{self.password_salt}#{self.password}")
  end

  def activate
    self.active = true
    self.save
  end
end
