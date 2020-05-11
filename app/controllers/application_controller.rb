require 'net/http'
require 'json'

class ApplicationController < ActionController::Base
  def index
    urls = ['https://takehome.io/twitter', 'https://takehome.io/facebook', 'https://takehome.io/instagram']
    @result = Array.new
    urls.each do |url|
      escaped_address = URI.escape(url)
      uri = URI.parse(escaped_address)
      res = Net::HTTP.get_response(uri)
      if res.is_a?(Net::HTTPSuccess)
        @result.push(JSON.parse(res.body))
      else
        @result.push(res.body)
      end
    end
    @result = @result.flatten
  end

end
