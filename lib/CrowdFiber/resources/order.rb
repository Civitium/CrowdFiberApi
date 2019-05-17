require "CrowdFiber/resources/resource_base"

module CrowdFiber
  module Resources
    class Order < CrowdFiber::Resources::ResourceBase

      def initialize(config)
        super(config)
        @verb = "orders"
      end

      def ids
        @result = make_get_request("/api/v2/orders/ids")
      end
    end
  end
end
