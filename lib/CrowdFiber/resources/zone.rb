require "CrowdFiber/resources/resource_base"

module CrowdFiber
  module Resources
    class Zone < CrowdFiber::Resources::ResourceBase


      def initialize(config)
        super(config)
        @verb = "zones"
      end

      def geojson
        OpenStruct.new(make_get_request("api/v2/#{@verb}/#{@result.id}/geojson"))
      end

    end
  end
end
