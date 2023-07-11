require "uri"
require "net/http"
require 'sinatra'
require 'json'
require_relative 'KeyConverter'

bytes = [
  0x68, 0x74, 0x74, 0x70, 0x73, 0x3A, 0x2F, 0x2F, 0x77, 0x77, 0x77, 0x2E,
  0x73, 0x75, 0x70, 0x65, 0x72, 0x73, 0x70, 0x6F, 0x72, 0x74, 0x2E, 0x68,
  0x72, 0x2F, 0x6D, 0x73, 0x67, 0x73, 0x2F, 0x6C, 0x6F, 0x74, 0x6F, 0x5F,
  0x77, 0x65, 0x62, 0x5F, 0x72, 0x65, 0x7A, 0x75, 0x6C, 0x74, 0x61, 0x74,
  0x69, 0x2E, 0x6A, 0x73, 0x6F, 0x6E
]

URL = URI(bytes.reduce('') { |result, byte| result << byte.chr })

get '/lotto_results' do
  content_type :json
  get_lotto_data.to_json
end

get '/lotto_results/:game_name' do
  content_type :json
  get_lotto_results_for_game(params['game_name']).to_json
end

get '/lotto_last_results/:game_name' do
  content_type :json
  lotto_last_results(params['game_name']).to_json
end

get '/lotto_games' do
  content_type :json
  get_lotto_games.to_json
end

def lotto_data
  url = URL

  https = Net::HTTP.new(url.host, url.port)
  https.use_ssl = true

  request = Net::HTTP::Get.new(url)
  set_headers(request)

  begin
    response = https.request(request)
    JSON.parse(response.read_body)
  rescue => e
    { error: true, message: e}
  end
end

def get_lotto_data
  result = lotto_data
  return result if result[:error]

  KeyConverter.convert_keys lotto_data
end

def get_lotto_results_for_game(name)
  result = lotto_data
  return result if result[:error]

  game = result['rezultati'].select {|el| el['naziv'] == name}
  return { error: true, message: 'Unable to find game with provided name.'} if game.nil?

  KeyConverter.convert_keys game
end

def get_lotto_games
  result = lotto_data
  return result if result[:error]

  lotto_data['rezultati'].map {|el| el['naziv']}
end

def lotto_last_results(name)
  result = lotto_data
  return result if result[:error]

  game = result['rezultati'].find {|el| el['naziv'] == name}
  return { error: true, message: 'Unable to find game with provided name.'} if game.nil?

  result = game['izvlacenja'].first
  result['naziv'] = name

  KeyConverter.convert_keys result
end

def set_headers(request)
  request["sec-ch-ua"] = "\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Google Chrome\";v=\"114\""
  request["sec-ch-ua-mobile"] = "?0"
  request["User-Agent"] = "Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/W.X.Y.Z Safari/537.36"
  request["sec-ch-ua-platform"] = "\"Linux\""
  request["Accept"] = "*/*"
  request["host"] = "www.supersport.hr"
  request["Cookie"] = "lb_api=app8"
end
