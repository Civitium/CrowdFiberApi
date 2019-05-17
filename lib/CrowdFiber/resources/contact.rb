require "CrowdFiber/resources/resource_base"


module CrowdFiber
  module Resources
    class Contact < CrowdFiber::Resources::ResourceBase

      def initialize(config)
        super(config)
        @verb = "contacts"
      end

      def last_id
        make_get_request("api/v2/#{@verb}", {sorted_by: "id_desc", per_page: 1})[0]['email_address']
      end

      def first_id
        make_get_request("api/v2/#{@verb}", {sorted_by: "id_asc", per_page: 1})[0]['email_address']
      end

    end
  end
end
