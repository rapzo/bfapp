require 'net/http'

class ProductsController < ApplicationController
  def index
    uri = URI('http://0.0.0.0:49191/api/artigos')
    @products = Net::HTTP.get(uri)
    puts @products

    @products = Products.all
    puts @products
  end

  def show
    @product = Products.new
    :params.inspect
    @product.inspect
  end

  def delete
  end

end