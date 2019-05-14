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
        self.orders =  make_get_request("api/v2/#{VERB}")
        return self
      end

      def find(id)
        self.order = make_get_request("api/v2/#{VERB}/#{id}")
        return self
      end

      def count
        return get_record_count("api/v2/#{VERB}")
      end

      def first
        make_get_request("api/v2/#{VERB}",{page:1, per_page: 1})
      end

      def last
        make_get_request("api/v2/#{VERB}",{page: count, per_page: 1})
      end

      #def method_missing(name, *args, &block)
      #  if account.has_key?(name.to_s)
      #    account[name.to_s]
      #  else
      #    super
      #  end
      #end

    end
  end
end
