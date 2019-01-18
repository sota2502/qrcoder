require 'rubygems'
require 'sinatra/base'
require 'sinatra/reloader'
require 'logger'
require 'unicorn'
require 'rqrcode'
require 'rqrcode_png'

class MainApp < Sinatra::Base
  get '/' do
    slim :index
  end

  get '/generate' do
    content = "WIFI:S:#{params['ssid']};T:#{params['type']};P:#{params['pass_phrase']};;"
    qr = RQRCode::QRCode.new(content, size: 8, level: :h)
    png = qr.to_img.resize(200, 200)
    slim :generate, locals: { image: png.to_data_url }
  end
end
