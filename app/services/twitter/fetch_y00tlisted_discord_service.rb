# frozen_string_literal: true

module Twitter
  # Fetches the y00tlisted users by looking at the @y00tlist Twitter account timeline,
  # using the Twitter API to get the Twitter profile of mentionned users
  class FetchY00tlistedDiscordService < FetchY00tlistedService
    def endpoint_url
      "https://api.twitter.com/2/users/#{ENV['Y00TS_AGGREGATOR_TWITTER_ID']}/tweets"
    end

    def create_y00t!(mentionned_user)
      Y00t.find_or_create_by!(
        twitter_username: mentionned_user['username'],
        twitter_user_id: mentionned_user['id']
      )
    end
  end
end
