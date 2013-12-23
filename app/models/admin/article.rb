# == Schema Information
#
# Table name: admin_articles
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class Admin::Article < ActiveRecord::Base
end
