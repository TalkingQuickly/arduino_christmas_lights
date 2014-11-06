require 'securerandom'
require 'yaml'

class ChristmasLightConfig
  def initialize
    load_or_create_config
  end

  def config
    @config ||= YAML::load_file(filename)
  end

  private

  def default_config
    {
      identifier: SecureRandom.hex
    }
  end

  def load_or_create_config
     if !File.exist?(filename)
       File.open(filename, 'w') {|f| f.write default_config.to_yaml }
     end
     config
  end

  def filename
    File.join(__dir__, '.xmas_lights')
  end

end
