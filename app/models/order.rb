# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  client_id  :integer
#  article_id :integer
#  quantity   :integer
#  status     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Order < ActiveRecord::Base
  def self.get_all
    begin
      orders = HTTParty.get("#{APIURI}clients/#{@client.id}/orders")
    rescue
      orders = self.all
    end
  end

  def self.get(id)
    begin
      order = HTTParty.get("#{APIURI}clients/#{@client.id}/orders/#{@id}")
    rescue
      order = self.where(id: id).first
    end
  end
end
