require "CrowdFiber/resources/order"
require "CrowdFiber/resources/zone"
require "CrowdFiber/resources/contact"
require "CrowdFiber/resources/target"

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

    def zones
      CrowdFiber::Resources::Zone.new(config)
    end

    def contacts
      CrowdFiber::Resources::Contact.new(config)
    end

    def targets
      CrowdFiber::Resources::Target.new(config)
    end
end
