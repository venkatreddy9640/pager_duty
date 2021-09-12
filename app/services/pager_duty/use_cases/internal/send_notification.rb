module PagerDuty::UseCases::Internal
  module SendNotification # PagerDuty::UseCases::Internal::SendNotification

    extend self

    def invoke(developer)
      url = 'https://run.mocky.io/v3/fd99c100-f88a-4d70-aaf7-393dbbd5d99f'
      request_body = {
        phone_number: developer.mobile,
        message: 'Too many 5xx!'
      }


      uri = URI(url)
      request = Net::HTTP::Post.new(uri, {"Content-Type" => 'application/json'})
      request.body = request_body.to_json

      Net::HTTP.start(
        uri.hostname,
        uri.port,
        :use_ssl => uri.scheme == 'https',
        :verify_mode => OpenSSL::SSL::VERIFY_PEER
      ) do |http|
        http.request(request)
      end
    end
  end
end
