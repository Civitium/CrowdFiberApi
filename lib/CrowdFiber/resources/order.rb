require "CrowdFiber/resources/resource_base"

module CrowdFiber
  module Resources
    class Order < CrowdFiber::Resources::ResourceBase
      VERB = "orders"
      attr_accessor :order
      attr_accessor :orders

      def initialize(config)
        super(config)
        @endpoint = "orders"
      end

      def all
        make_get_request("api/v2/#{VERB}")
      end

      def find(id)
        OpenStruct.new(make_get_request("api/v2/#{VERB}/#{id}").first)
      end

      def count
        return get_record_count("api/v2/#{VERB}")
      end

      def last_id
        make_get_request("api/v2/#{VERB}",{page: 1, per_page: 1})[0][:id]
      end

      def first_id
        make_get_request("api/v2/#{VERB}",{page: count, per_page: 1})[0][:id]
      end

      def first
        find(first_id)
      end

      def last
        find(last_id)
      end
    end
  end
end
