module CrowdFiberApi
  class Private
    class Account < CrowdFiberApi::Private
      attr_accessor :account
      attr_accessor :accounts
      
      def initialize(config)
        super(config)
        @endpoint = "accounts"
      end
      

      def all
        self.accounts =  make_get_request("/api/v1/accounts")
        return self
      end
  
      def find(id)
        self.account = make_get_request("/api/v1/accounts/#{id}")
        return self
      end
      
      def count
        return accounts.count
      end
      
      def first
        return accounts.first
      end
      
      def last
        return accounts.last
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