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

    @product= Product.new(title: @json["objects"].first["title"],
    price: @json["objects"].first["offerPrice"],url: @json["objects"].first["pageUrl"],
    brand: @json["objects"].first["brand"], product_id: @json["objects"].first["productId"],
    category: @json["objects"].first["inferredCategory_beta"])
    if @product.save
      flash[:success] = 'Product scrapped!'
      redirect_to action: "show", id: @product.id
    else
      flash[:danger]= 'An error occurred.'
    end
  end

    # puts res.body if res.is_a?(Net::HTTPSuccess)
    # @params = params.require(:product).permit(:url)
  end

  def show
      @product = Product.find(params[:id])
  end
  def index
    @products = Product.all
  end
end
