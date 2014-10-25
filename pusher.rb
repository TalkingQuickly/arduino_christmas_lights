require 'pusher-client'
require './arduino'

arduino = Arduino.new

options = { secure: true } 
socket = PusherClient::Socket.new(ENV['PUSHER_KEY'], options)
socket.subscribe('test1')

socket.bind('globalevent') do |data|
  arduino.sparkle
end
socket.connect
