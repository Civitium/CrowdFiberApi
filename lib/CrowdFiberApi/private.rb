require "CrowdFiberApi/private/account"

class CrowdFiberApi::Private
  
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

  


  def account
    CrowdFiberApi::Private::Account.new(@config)
  end


  def make_get_request(path, params = {})
    begin
      a =  RestClient.get @config[:api_url] + path, authorization: "Token token=#{@config[:api_key]}"
    rescue RestClient::Unauthorized, RestClient::Forbidden => err
      puts 'Access denied'
      return err.response
    end
    return JSON.parse(a)
  end
  
  def call(request_env)
    request_env[:request_headers].merge!("Authorization: Token token=#{api_key}")
  end
  
end