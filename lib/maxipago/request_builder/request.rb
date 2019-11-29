require 'net/http'
require 'uri'

module Maxipago
  module RequestBuilder
    class Request

      def initialize(maxipagoId, apiKey)
        @maxipagoId = maxipagoId
        @apiKey = apiKey
        @apiVersion = Maxipago::Client::APIVERSION
        @header = { "Content-Type" => 'text/xml' }
      end

      def send_command(opts)
        xml = build_xml(opts)
        send_request(xml)
      end

      private

      def send_request(xml)
        set_uri
        set_http_session

        @http_session.start { |http|
          response = http.post(@uri.path, xml, @header)
          { header: response, body: response.body, message: response.message }
        }
      end

      def set_uri
        raise "This is an abstract method"
      end

      def build_xml(opts)
        raise "This is an abstract method"
      end

      def set_http_session
        @http_session = Net::HTTP.new(@uri.host, @uri.port)
        @http_session.use_ssl = true if @uri.scheme == "https"
        set_ssl_mode if @http_session.use_ssl?
      end

      def set_ssl_mode
        @http_session.verify_mode = OpenSSL::SSL::VERIFY_NONE
        @http_session.ssl_timeout = 30
      end
    end
  end
end