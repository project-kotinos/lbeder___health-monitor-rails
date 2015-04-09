module HealthMonitor
  class Configuration
    PROVIDERS = [:cache, :database, :redis, :resque, :sidekiq].freeze

    attr_accessor :error_callback, :basic_auth_credentials
    attr_reader :providers

    def initialize
      @providers = Set.new([:database])
    end

    PROVIDERS.each do |provider|
      define_method provider do |&block|
        require "health_monitor/providers/#{provider}"

        @providers << provider

        "HealthMonitor::Providers::#{provider.capitalize}".constantize
      end
    end
  end
end
