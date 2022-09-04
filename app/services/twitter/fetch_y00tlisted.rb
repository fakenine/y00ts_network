# frozen_string_literal: true

module Twitter
  # Fetches the y00tlisted users by looking at the @y00tlist Twitter account timeline,
  # using the Twitter API to get the Twitter profile of mentionned users
  class FetchY00tlisted
    ENDPOINT_URL = "https://api.twitter.com/2/users/#{ENV['Y00TLIST_TWITTER_ID']}/tweets".freeze

    def perform
      fetch_y00tlisted_users
    end

    private

    def fetch_y00tlist_tweets
      request = Typhoeus::Request.new(ENDPOINT_URL, request_options)
      response = request.run
      JSON.parse(response.body)['data']
    rescue StandardError => e
      Rails.logger.error e
    end

    def fetch_y00tlisted_users
      tweets = fetch_y00tlist_tweets

      tweets.map do |tweet|
        next unless tweet['text'].starts_with?('Welcome')

        mentionned_user = tweet.dig('entities', 'mentions')&.first
        next unless mentionned_user

        create_y00t!(mentionned_user)
      end
    end

    def create_y00t!(mentionned_user)
      Y00t.find_or_create_by!(
        twitter_username: mentionned_user['username'],
        twitter_user_id: mentionned_user['id']
      )
    end

    def request_params
      {
        'max_results' => 100,
        'expansions' => 'author_id',
        'tweet.fields' => 'author_id,conversation_id,created_at,entities,id',
        'user.fields' => 'description'
      }
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
