module Wit
  class Client

    def initialize
      @config = {
        protocol: "https",
        server: "api.wit.ai/speech",
        token: "Bearer N7H5MN53KGY5IHBSO3U2CDLRH5JYHWVF"
      }
    end

    def base_url
      "#{@config[:protocol]}://#{@config[:server]}"
    end

    def post payload
      begin
        return parse(RestClient.post "#{base_url}", payload, { 'Content-Type' => 'audio/wav', :Authorization => 'Bearer N7H5MN53KGY5IHBSO3U2CDLRH5JYHWVF'})[:_text]

        # parse(RestClient::Request.execute(method: :post, url: "#{base_url}",
        # payload: payload, headers: header, 'Authorization:' => @config[:token]))
      rescue Exception=> e
        raise e
        return false
      end
    end

    def parse(responce)
      MultiJson.load(responce, :symbolize_keys => true)
    end

    protected

    def header
      @header ||= { 'Content-Type' => 'audio/wav', 'Authorization:' => @config[:token]}
    end

  end
end
