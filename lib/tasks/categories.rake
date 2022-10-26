namespace :categories do
  task :match do
    Categories::Match.new.perform
  end
end
