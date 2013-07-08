require 'net/http'

module TeamCityBuildFinder
  class JsonRequest
    def initialize(username, password)
      @username = username
      @password = password
    end

    def get(url)
      uri = URI(url)
      http_obj=Net::HTTP.new(uri.host, uri.port)
      request=Net::HTTP::Get.new(uri.request_uri)
      request['Accept'] = 'application/json'
      request.basic_auth(@username, @password)
      return http_obj.request(request).body
    end
  end
end