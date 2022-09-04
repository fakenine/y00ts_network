# frozen_string_literal: true

module Twitter
  # Fetches the twitter profile of a y00tlisted user
  class FetchUserProfilesService < RequestService
    def initialize(twitter_user_ids = [])
      @y00ts = Y00t.where(twitter_user_id: twitter_user_ids)
    end

    def perform
      fetch_profiles
    end

    private

    def endpoint_url
      "https://api.twitter.com/2/users"
    end

    def fetch_profiles
      profiles = run_request

      profiles.each do |profile|
        Y00t.find_by!(twitter_user_id: profile["id"])
            .update!(
              twitter_profile_image_url: profile["profile_image_url"],
              twitter_verified: profile["verified"],
              twitter_description: profile["description"]
            )  
      end
    end

    def request_params
      {
        'ids' => @y00ts.pluck(:twitter_user_id).join(','),
        'user.fields' => 'name,username,description,profile_image_url,verified'
      }
    end
  end
end
