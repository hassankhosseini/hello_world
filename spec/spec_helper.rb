require_relative '../hello'

require 'yaml'

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
end
