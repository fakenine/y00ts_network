# frozen_string_literal: true

module Twitter
  # Fetches the y00tlisted users by looking at the @y00tlist Twitter account timeline,
  # using the Twitter API to get the Twitter profile of mentionned users
  class FetchY00tlistedService < RequestService
    def perform
      fetch_y00tlisted_users
    end

    private

    def fetch_y00tlisted_users
      tweets = run_request

      tweets.map do |tweet|
        next unless mentions_y00tlisted?(tweet['text'])

        mentionned_user = tweet.dig('entities', 'mentions')&.first
        next unless mentionned_user

        create_y00t!(mentionned_user)
      end
    end

    def mentions_y00tlisted?(text)
      text.starts_with?('Welcome') || text.starts_with?('RT')
    end

    def create_y00t!(mentionned_user)
      Y00t.find_or_create_by!(
        twitter_username: mentionned_user['username'],
        twitter_user_id: mentionned_user['id']
      )
    end

    def endpoint_url
      "https://api.twitter.com/2/users/#{ENV['Y00TLIST_TWITTER_ID']}/tweets"
    end

    def request_params
      {
        'max_results' => 100,
        'expansions' => 'author_id',
        'tweet.fields' => 'author_id,conversation_id,created_at,entities,id',
        'user.fields' => 'description'
      }
    end
  end
end
