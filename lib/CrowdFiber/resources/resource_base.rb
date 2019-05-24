require "rest-client"
require "json"
require "uri"
require 'ostruct'

module CrowdFiber
  module Resources
    class ResourceBase
      attr_reader :config, :endpoint

      def initialize(config)
        @config = config
      end

      def list(page = 1, per_page = 10, params = {})
        params['page'] = page
        params['per_page'] = per_page
        @result = make_get_request("api/v2/#{@verb}", params)
      end

      def find(id)
        @result = OpenStruct.new(make_get_request("api/v2/#{@verb}/#{id}"))
      end

      def count
        @result = get_record_count("api/v2/#{@verb}", {per_page: 1})
      end

      def last_id
        @result = make_get_request("api/v2/#{@verb}", {sorted_by: "id_desc", per_page: 1})[0]['id']
      end

      def first_id
        @result = make_get_request("api/v2/#{@verb}", {sorted_by: "id_asc", per_page: 1})[0]['id']
      end

      def first
        @result = find(first_id)
        self
      end

      def last
        @result = find(last_id)
      end

      def make_get_request(path, params = {})
        begin
          a = RestClient.get @config[:api_url] + path, {accept: :json, params: params, authorization: "Token token=#{@config[:api_key]}"}
        rescue RestClient::Unauthorized, RestClient::Forbidden => err
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

      def get_headers(path, params = {})
        begin
          a =  RestClient.get @config[:api_url] + path, {accept: :json, params: params, authorization: "Token token=#{@config[:api_key]}"}

        rescue RestClient::Unauthorized, RestClient::Forbidden => err
          puts 'Access denied'
          return err.response
        end
        return a.headers
      end

      def call(request_env)
        request_env[:request_headers].merge!("Authorization: Token token=#{api_key}")
      end

    end
  end
end
