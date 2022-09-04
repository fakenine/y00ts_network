module Categories
  class MatchService
    def initialize
      @regexes = YAML.load_file("#{Rails.root}/lib/data/regexes.yml")
      @categories = Category.all
    end
    
    def perform
      match_y00ts_to_categories
    end

    private

    def match_y00ts_to_categories
      Y00t.find_each do |y00t|
        @regexes.each do |category_name, regex|
          if y00t.twitter_description.match?(Regexp.new(regex, 'i'))
            add_category(y00t, category_name)
          end
        end
      end
    end

    def add_category(y00t, category_name)
      category = @categories.find { |cat| cat.name == category_name }
      y00t.categories << category unless category.id.in?(y00t.category_ids)
    end
  end
end
