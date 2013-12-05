require 'net/http'

class Client
	include ActiveModel::Serializers::JSON

	self.uri = 'http://0.0.0.0:1337:/api/clients/'

	def fetch(id)
    uri = URI(@uri)
    begin
	    @products = Net::HTTP.get(uri)
		rescue
		end
	end

	def attributes=(hash)
		hash.each do |key, value|
			instance_variable_set("@#{key}", value)
		end
	end

	def attributes
		instance_values
	end
end
