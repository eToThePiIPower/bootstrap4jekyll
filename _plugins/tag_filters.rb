module Jekyll
  module TagFilters
    def popular_tags(tags)
      tags.sort do |a, b|
        b[1].length <=> a[1].length
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::TagFilters)
