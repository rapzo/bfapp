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
#  country           :string(255)
#  market            :string(255)
#  payment_type      :string(255)
#  payment_condition :string(255)
#  discount          :integer
#  currency          :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

class Client < ActiveRecord::Base

  def self.get_all
    begin
      clients = HTTParty.get("#{APIURI}clients")
    rescue
      clients = self.all
    end
  end

  def self.get(id)
    begin
      client = HTTParty.get("#{APIURI}clients/#{id}")
    rescue
      client = self.where(id: id).first
    end
  end

  def self.post(id)
  end

end
