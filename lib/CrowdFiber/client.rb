require "CrowdFiber/resources/order"

class CrowdFiber::Client

    attr_reader :config

    def initialize(config = {})
      if config.nil? || config[:api_key].nil?
        raise ArgumentError.new(":api_key is a required argument to initialize Api")
      end

      if config.nil? || config[:api_url].nil?
        raise ArgumentError.new(":api_url is a required argument to initialize CrowdFiberApi")
      end
      @config = config
    end

    def orders
      CrowdFiber::Resources::Order.new(config)
    end
end
