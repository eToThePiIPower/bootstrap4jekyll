module Jekyll
  module SortFilters
    def popular_tags(tags)
      tags.sort do |a, b|
        b[1].length <=> a[1].length
      end
    end

    def sort_categories(categories)
      categories.sort do |a, b|
        a_weight = get_weight(a)
        b_weight = get_weight(b)
        b_weight <=> a_weight
      end
    end

    private

    def get_weight(category)
      site = @context.registers[:site]
      category_name = category.first
      category_config = site.config['categories_meta'][category_name]

      if category_config
        category_config['weight'] || 0
      else
        0
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::SortFilters)
