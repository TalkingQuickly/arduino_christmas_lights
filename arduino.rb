require 'arduino_firmata'

class Arduino
  def initialize
    @arduino = ArduinoFirmata.connect
    @pin = 9
  end

  attr_accessor :arduino, :pin

  def fade_in(sleep_interval=0.01)
    0.upto(255) do |i|
      arduino.analog_write pin, i
      sleep(sleep_interval)
    end
  end

  def fade_out(sleep_interval=0.01)
    0.upto(255) do |i|
      arduino.analog_write pin, 255-i
      sleep(sleep_interval)
    end
  end

  def blink(interval)
    fade_in interval
    sleep(0.02)
    fade_out interval
  end

  def sparkle(count=5,sleep_interval=0.1)
    0.upto(count) do |i|
      arduino.digital_write pin, true
      sleep sleep_interval
      arduino.digital_write pin, false
      sleep sleep_interval
    end
  end
end
