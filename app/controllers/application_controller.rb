class ApplicationController < ActionController::Base
  def index
    render text: "Thanks for sending a GET request with cURL! Payload: #{request.body.read}"
  end
end
