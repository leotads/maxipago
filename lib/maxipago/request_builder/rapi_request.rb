require "net_https"
require "uri"

module Maxipago
  module RequestBuilder
    class RapiRequest < Maxipago::RequestBuilder::Request
      URL = ENV[MP_URL_RAPI] || "https://testeapi.maxipago.net/ReportsAPI/servlet/ReportsAPI"

      private

      def set_uri
        @uri = URI.parse(opts)
      end

      def build_xml(opts)
        Maxipago::XmlBuilder::BuilderRapi.new(@maxipagoId, @apiKey, @apiVersion, opts).get_xml_data
      end
    end
  end
end