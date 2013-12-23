# == Schema Information
#
# Table name: clients
#
#  id                :integer          not null, primary key
#  code              :string(255)
#  name              :string(255)
#  nif               :string(255)
#  address           :string(255)
#  phone             :string(255)
#  fax               :string(255)
#  email             :string(255)
#  country           :string(255)
#  market            :string(255)
#  payment_type      :string(255)
#  payment_condition :string(255)
#  discount          :integer
#  currency          :string(255)
#  password          :string(255)
#  username          :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

class Client < ActiveRecord::Base
  has_one :user

  validates_presence_of :name, :message => "Please write a name."
  validates_presence_of :nif, :message => "Please write a valid NIF."
  validates_presence_of :address, :message => "Please write a valid address."
  validates_presence_of :phone, :message => "Please write a valid phone number."
  # validates_presence_of :country, :message => "Please write a valid country."
  # validates_presence_of :currency, :message => "Please chose a valid currency."
  validates_presence_of :email, :message => "Please write a valid email."
  validates_presence_of :password, :message => "Please write a valid password."

  def self.currency
    currencies = {:euro => 'EUR'}
  end

end
