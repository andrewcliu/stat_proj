
class CoingeckoController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'json'

  def market_data
    url = URI.parse('https://api.coingecko.com/api/v3/coins/markets')
    
    query_params = {
      vs_currency: 'usd',      
      order: 'market_cap_desc', 
      per_page: 50,            
      page: 1,                
      sparkline: false         
    }
    url.query = URI.encode_www_form(query_params)

    # Make the HTTP GET request to CoinGecko API
    response = Net::HTTP.get_response(url)

    if response.is_a?(Net::HTTPSuccess)
      render json: JSON.parse(response.body)
    else
      render json: { error: "Failed to retrieve data" }, status: :unprocessable_entity
    end
  end
end
