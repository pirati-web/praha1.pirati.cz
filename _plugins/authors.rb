require 'twitter_cldr'

module Jekyll

  class AuthorPageGenerator < Jekyll::Generator

    def generate(site)
      site.data['authors'].each do |author, posts|
        site.pages << AuthorPage.new(site, author, posts)
      end
    end
  end

  class AuthorPage < Jekyll::Page
    def initialize(site, author, posts)
      author_slug = Utils.slugify(author, :mode => "latin")
      @site = site
      @base = site.source
      @dir = '/authors/'
      @basename = author_slug
      @ext = '.html'
      @name = @basename + @ext
      @path = site.in_source_dir(@base, @dir, @name)
      @data = {
        'author' => author,
        'posts' => posts,
        'layout' => 'authors',
        'permalink' => '/aktuality/autori/' + author_slug + '/',
        'pagination' => {
          'enabled' => true,
          'permalink' => '/:num/',
        }
      }
    end
  end
end

Jekyll::Hooks.register :site, :post_read do |site|
  # Create hash { author => posts }
  authors = Hash.new { |h, key| h[key] = [] }
  site.posts.docs.each do |post|
    if uid = post.data['authorId']
      post.data['category'] = uid
      authors[uid] << post
    end
    authors.each_value { |posts| posts.sort!.reverse! }
  end
  # Enrich people collection data with posts - used in generator and personal pages
  site.collections['people'].docs.each { |p| p.data['posts'] = authors[p.data['uid']] }

  # Create hash for authors with posts { name => uid }
  people = site.collections['people'].docs.collect { |p| [p.data['name'], p.data['uid']] if authors[p.data['uid']].count > 0 }.compact.to_h

  # Sort the authors by name and store them in site.data if have posts
  collator = TwitterCldr::Collation::Collator.new(:cs)
  site.data['authors'] = collator.sort(people.keys).collect { |author| [author, authors[people[author]]] }.to_h
end
