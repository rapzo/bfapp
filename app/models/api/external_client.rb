require 'httparty'

class ExternalClient
	include ActiveModel::Serializers::JSON

	def fetch(id)
		uri = 'http://0.0.0.0:1337:/api/clients/'
    begin
	    @products = HTTParty.get(@uri)
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
