# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  code       :string(255)
#  name       :string(255)
#  price      :string(255)
#  unit       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Article < ActiveRecord::Base
end
