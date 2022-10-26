namespace :twitter do
  task :fetch_y00tlisted_users do
    Twitter::FetchY00tlistedService.new.perform
    Twitter::FetchY00tlistedDiscordService.new.perform
  end

  task :fetch_users_profiles do
    Twitter::FetchUsersProfilesService.new(Y00t.pluck(:twitter_user_id)).perform
  end
end
