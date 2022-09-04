module Twitter
  class RequestService
    private

    def run_request
      request = Typhoeus::Request.new(endpoint_url, request_options)
      response = request.run
      JSON.parse(response.body)['data']
    rescue StandardError => e
      Rails.logger.error e
    end

    def endpoint_url
      raise NotImplementedError
    end

    def request_params
      raise NotImplementedError
    end

    def request_headers
      {
        'Authorization' => "Bearer #{ENV['TWITTER_BEARER_TOKEN']}"
      }
    end

    def request_options
      {
        method: 'get',
        headers: request_headers,
        params: request_params
      }
    end
  end
end
