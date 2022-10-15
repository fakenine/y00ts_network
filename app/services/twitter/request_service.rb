module Twitter
  class RequestService
    private

    def run_request(opts = {})
      request = Typhoeus::Request.new(endpoint_url, request_options(opts))
      response = request.run
      JSON.parse(response.body)
    rescue StandardError => e
      Rails.logger.error e
    end

    def endpoint_url
      raise NotImplementedError
    end

    def request_params(opts = {})
      raise NotImplementedError
    end

    def request_headers
      {
        'Authorization' => "Bearer #{ENV['TWITTER_BEARER_TOKEN']}"
      }
    end

    def request_options(opts = {})
      {
        method: 'get',
        headers: request_headers,
        params: request_params(opts)
      }
    end
  end
end
