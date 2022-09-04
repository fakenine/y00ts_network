# frozen_string_literal: true

module Twitter
  # Fetches the twitter profile of a y00tlisted user
  class FetchUserProfileService < RequestService
    def initialize(twitter_user_id)
      @y00t = Y00t.find_by(twitter_user_id: twitter_user_id)
    end

    def perform
      fetch_profile
    end

    private

    def endpoint_url
      "https://api.twitter.com/2/users"
    end

    def fetch_profile
      run_request
    end

    def request_params
      {
        'ids' => @y00t.twitter_user_id
      }
    end
  end
end
