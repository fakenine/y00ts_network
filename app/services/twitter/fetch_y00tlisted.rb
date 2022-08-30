module Twitter
  class FetchY00tlisted
    ENDPOINT_URL = "https://api.twitter.com/2/users/#{ENV['Y00TLIST_TWITTER_ID']}/tweets"

    def perform
      get_y00tlisted_users
    end

    private

    def get_y00tlist_tweets
      params = {
        "max_results" => 100,
        "expansions" => "author_id",
        "tweet.fields" => "attachments,author_id,conversation_id,created_at,entities,id,lang",
        "user.fields" => "description"
      }

      headers = {
        "Authorization" => "Bearer #{ENV['TWITTER_BEARER_TOKEN']}"
      }

      options = {
        method: 'get',
        headers: headers,
        params: params
      }
    
      request = Typhoeus::Request.new(ENDPOINT_URL, options)
      response = request.run
      JSON.parse(response.body)["data"]
    rescue StandardError => e
      Rails.logger.error e
    end

    def get_y00tlisted_users
      tweets = get_y00tlist_tweets

      tweets.map do |tweet|
        next unless tweet["text"].starts_with?("Welcome")

        y00tlisted_user = tweet["entities"]["mentions"].first
        y00t = Y00t.create!(username: y00tlisted_user["username"], twitter_user_id: y00tlisted_user["id"])

        y00t
      end
    end
  end
end
