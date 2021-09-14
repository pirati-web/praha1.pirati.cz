require 'twitter_cldr'

module Jekyll

  class TagPageGenerator < Jekyll::Generator

    def generate(site)
      site.data['tags'].each do |tag, posts|
        site.pages << TagPage.new(site, tag, posts)
      end
    end
  end

  class TagPage < Jekyll::Page
    def initialize(site, tag, posts)
      tag_slug = Utils.slugify(tag, :mode => "latin")
      @site = site
      @base = site.source
      @dir = '/tags/'
      @basename = tag_slug
      @ext = '.html'
      @name = @basename + @ext
      @path = site.in_source_dir(@base, @dir, @name)
      @data = {
        'tag' => tag,
        'posts' => posts,
        'layout' => 'tags',
        'permalink' => '/aktuality/stitky/' + tag_slug +  '/',
        'pagination' => {
          'enabled' => true,
          'permalink' => '/:num/',
        }
      }
    end
  end
end

Jekyll::Hooks.register :site, :post_read do |site|
  # Sort the tags by name and store them in site.data
  collator = TwitterCldr::Collation::Collator.new(:cs)
  site.data['tags'] = collator.sort(site.tags.keys).collect { |tag| [tag, site.tags[tag]] }.to_h

  # Enrich the Map data for post with the tag slug
  site.data['map']['posts'].each { |item|
    tag = item['title']
    item['slug'] = Jekyll::Utils.slugify(tag, :mode => "latin")
    item['size'] = site.data['tags'][tag].to_a.size()
  }
end
