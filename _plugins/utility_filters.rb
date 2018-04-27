module Jekyll
  module UtilityFilters
    def page_path(page)
      if page==1
        return '/'
      else
        return "/#{page}"
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::UtilityFilters)
