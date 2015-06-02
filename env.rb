$LOAD_PATH.unshift(File.expand_path('.', File.dirname(__FILE__)))

require 'active_support'
require 'active_support/core_ext'

METRICS = File.expand_path('data/metrics.csv', File.dirname(__FILE__))
