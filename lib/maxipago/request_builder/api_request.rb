require "net/http"
require "uri"

module Maxipago
  module RequestBuilder
    class ApiRequest < Maxipago::RequestBuilder::Request
      URL = ENV['MP_URL_API'] || "https://api.maxipago.net/UniversalAPI/postAPI"

      private

      def set_uri
        @uri = URI.parse(URL)
      end

      def build_xml(opts)
        Maxipago::XmlBuilder::BuilderApi.new(@maxipagoId, @apiKey, @apiVersion, opts).get_xml_data
      end
    end
  end
end