require "CrowdFiber/resources/resource_base"

module CrowdFiber
  module Resources
    class Target < CrowdFiber::Resources::ResourceBase

      def initialize(config)
        super(config)
        @verb = "targets"
      end
      
    end
  end
end
