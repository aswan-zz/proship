Warbler::Config.new do |config|
  config.webxml.rails.env = 'development'
  config.webxml.jruby.min.runtimes = 1
  config.webxml.jruby.max.runtimes = 4
  config.features = %w(EXECUTABLE)
  config.features = %w(compiled)
end
