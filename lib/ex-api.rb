# require 'ruby-debug'
require 'pathname'

require 'ex-api/version'
require 'ex-api/api_helper'

module ExApi
  extend self

  attr_accessor :root_path,
                :lib_path,
                :env,
                :logger,
                :settings

  def configure(env)
    @env      = env
    @logger   = env.logger
    @settings = env.config[:settings]
  end

end

ExApi.root_path  = Pathname.new(File.expand_path('../..', __FILE__))
ExApi.lib_path   = ExApi.root_path.join('lib/ex-api')

# Load controllers
Dir[ExApi.lib_path.join('controllers').to_s+'/*.rb'].each {|f| require f }

# Load router
require 'ex-api/router'
