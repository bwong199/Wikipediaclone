class MainController < ApplicationController
$emoji_uri = "https://api.github.com/emojis"

$mood 

def index
	render 'index'
end 

def show

  	  uri = URI.parse($emoji_uri)
      http = Net::HTTP.new(uri.host, uri.port)
      
      #to be able to access https URL, these line should be added
      #github api has an https URL
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      
      #store the body of the requested URI
      data = response.body
      
      #to parse JSON string; you may also use JSON.parse()
      #JSON.load() turns the data into a hash
      @emoji= JSON.load(data)
      puts @emoji
      @mood = $mood
      render 'show'
end 

  
  def get_api

  		$mood = params[:mood]
  		redirect_to '/mood'
  end
end
