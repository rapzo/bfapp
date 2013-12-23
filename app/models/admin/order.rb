# == Schema Information
#
# Table name: admin_orders
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class Admin::Order < ActiveRecord::Base
end
