require 'active_resource'

class Products < ActiveResource::Base
  self.site = 'http://0.0.0.0:49191/api/articles'
end