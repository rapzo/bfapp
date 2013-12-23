# == Schema Information
#
# Table name: admin_users
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class Admin::User < ActiveRecord::Base
end
