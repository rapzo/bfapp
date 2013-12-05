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
end
