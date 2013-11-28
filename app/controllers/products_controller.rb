class ProductsController < ApplicationController
  def index
    begin
      @products = Products.all
    rescue Errno::ECONNREFUSED => c
      puts 'API DAUN!'
    end
  end

  def show
    @product = Products.new
    :params.inspect
    @product.inspect
  end

  def delete
  end

end
