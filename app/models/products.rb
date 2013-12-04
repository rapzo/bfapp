require 'active_resource'

class Products < ActiveResource::Base
  self.site = "http://localhost:49191/api"
  self.prefix = "/artigos"
end