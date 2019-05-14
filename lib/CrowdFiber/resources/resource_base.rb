require "rest-client"
require "json"
require "uri"

module CrowdFiber
  module Resources
    class ResourceBase
      attr_reader :config, :endpoint

      def initialize(config)
        @config = config
      end

      def make_get_request(path, params = {})
        begin
          a =  RestClient.get @config[:api_url] + path, {accept: :json, params: params, authorization: "Token token=#{@config[:api_key]}"}
          puts a.headers
        rescue RestClient::Unauthorized, RestClient::Forbidden => err
          puts 'Access denied'
          return err.response
        end
        return JSON.parse(a)
      end

      def get_record_count(path, params = {})
        begin
          a =  RestClient.get @config[:api_url] + path, {accept: :json, params: params, authorization: "Token token=#{@config[:api_key]}"}

        rescue RestClient::Unauthorized, RestClient::Forbidden => err
          puts 'Access denied'
          return err.response
        end
        return a.headers[:x_total_count].to_i
      end

      def call(request_env)
        request_env[:request_headers].merge!("Authorization: Token token=#{api_key}")
      end


    end
  end
end