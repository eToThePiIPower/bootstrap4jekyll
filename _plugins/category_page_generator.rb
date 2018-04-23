module Jekyll
  # Define Category Index Pages
  class CategoryPage < Page
    def initialize(site, base, dir, category)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'
      @category = category.to_s

      process(@name)
      read_yaml(File.join(base, '_layouts'), 'category_index.html')

      set_metadata
    end

    private

    def set_metadata
      data['title'] = title
      data['subtitle'] = subtitle
      data['header'] = header
      data['category'] = @category
      data['menu-item'] = @category
    end

    def title
      if category_has_key('long_title')
        site.config['categories_meta'][@category]['long_title']
      else
        @category.capitalize
      end
    end

    def subtitle
      if category_has_key('description')
        site.config['categories_meta'][@category]['description']
      else
        "Posts in the #{@category} section"
      end
    end

    def header
      if category_has_key('header')
        site.config['categories_meta'][@category]['header']
      elsif default_has_key('header')
        site.config['categories_meta']['default']['header']
      end
    end

    def category_has_key(key)
      @site.config['categories_meta'].key?(@category) &&
        @site.config['categories_meta'][@category].key?(key)
    end

    def default_has_key(key)
      @site.config['categories_meta'].key?('default') &&
        @site.config['categories_meta']['default'].key?(key)
    end
  end

  # Generate Category Index Pages
  class CategoryPageGenerator < Generator
    safe true

    def generate(site)
      if site.layouts.key? 'category_index'
        dir = site.config['category_dir'] || 'categories'
        site.categories.each_key do |category|
          site.pages << CategoryPage.new(site, site.source,
                                         File.join(dir, category), category)
        end
      end
    end
  end
end
