class ProductController < ApplicationController
  require 'net/http'

  def test
    # if a link is submitted
    if params[:product]
      url = params[:product][:url]
      uri = URI('https://api.diffbot.com/v3/product')
      params = { :token => "a20ec1a881592d4fb793e3d2a7432d35",
        :url => url,
        :discussion => "false" }
        uri.query = URI.encode_www_form(params)
        res = Net::HTTP.get_response(uri)
        @json = JSON.parse(res.body)
        if @json["objects"] == nil
          flash[:danger]= 'An error occurred.'
          redirect_to '/'
        else
          @product= Product.new(title: @json["objects"].first["title"],json: @json["objects"].first)
          if @product.save
            flash[:success] = 'Product scrapped!'
            redirect_to action: "show", id: @product.id
          else
            flash[:danger]= 'An error occurred.'
            redirect_to '/'
          end
        end
      end
    end

  def show
      @product = Product.find(params[:id])
  end
  def index
    @products = Product.all
  end
end
