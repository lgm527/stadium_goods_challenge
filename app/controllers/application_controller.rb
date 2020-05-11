require 'net/http'
require 'json'

class ApplicationController < ActionController::Base
  def index
    urls = ['https://takehome.io/twitter', 'https://takehome.io/facebook', 'https://takehome.io/instagram']
    urls.each_with_index do |url, i|
      escaped_address = URI.escape(url)
      uri = URI.parse(escaped_address)

      if i == 0
        res = Net::HTTP.get_response(uri)
        @twitter = res.body === "I am trapped in a social media factory send help" ? res.body : JSON.parse(res.body)
      elsif i == 1
        res1 = Net::HTTP.get_response(uri)
        @facebook = res1.body === "I am trapped in a social media factory send help" ? res1.body : JSON.parse(res1.body)
      elsif i == 2
        res2 = Net::HTTP.get_response(uri)
        @instagram = res2.body === "I am trapped in a social media factory send help" ? res2.body : JSON.parse(res2.body)
      end

    end
    @content = {
      twitter: @twitter,
      facebook: @facebook,
      instagram: @instagram
    }
    render plain: @content.to_json
  end

end
