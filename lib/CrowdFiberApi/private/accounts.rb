module CrowdFiberApi
  class Private
    class Accounts < CrowdFiberApi::Private
      attr_accessor :account
      attr_accessor :accounts
      
      def initialize(config)
        super(config)
        @endpoint = "accounts"
      end
  

      def all
        return make_get_request("/api/v1/accounts")
      end
  
      def find(id)
        self.account = make_get_request("/api/v1/accounts/#{id}")
        return self
      end
      
      
      def method_missing(name, *args, &block)
        if account.has_key?(name.to_s)
          account[name.to_s]
        else
          super
        end
      end

    end
  end
end