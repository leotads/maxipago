require "net/http"
require "uri"

module Maxipago
  module RequestBuilder
    class TransactionRequest < Maxipago::RequestBuilder::Request
      URL = ENV['MP_URL_TRANSACTION'] || "https://testapi.maxipago.net/UniversalAPI/postXML"

      private

      def set_uri
        @uri = URI.parse(URL)
      end

      def build_xml
        Maxipago::XmlBuilder::BuilderTransaction.new(@maxipagoId, @apiKey, @apiVersion, opts).get_xml_data
      end
    end
  end
end