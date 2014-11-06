require 'pusher-client'
require 'yaml'
require './arduino'
require './christmas_light_config'

config = ChristmasLightConfig.new
puts "identifier: #{config.config[:identifier]}"

arduino = Arduino.new

options = { secure: true }
socket = PusherClient::Socket.new(ENV['PUSHER_KEY'], options)
socket.subscribe(config.config[:identifier])

socket.bind('globalevent') do |data|
  arduino.sparkle
end
socket.connect
