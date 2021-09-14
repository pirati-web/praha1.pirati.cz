module Jekyll
  module Paginate

    class PageTrail
      attr_reader :num, :path

      def initialize( num, path )
        @num = num
        @path = path
      end

      def to_liquid
        { 'num' => num, 'path' => path }
      end
    end

    class Pager
      attr_reader :page, :per_page, :posts, :total_posts, :total_pages,
        :previous_page, :previous_page_path, :next_page, :next_page_path, :page_path, :page_trail,
        :first_page, :first_page_path, :last_page, :last_page_path

      def initialize(page, per_page, total_pages, posts, permalink, template_url)
        @page = page
        @page_path = @page == 1 ? template_url : permalink.sub(':num', @page.to_s)
        @per_page = per_page
        @total_pages = total_pages
        @total_posts = posts.size

        init = (@page - 1) * @per_page
        offset = (init + @per_page - 1) >= @total_posts ? @total_posts : (init + @per_page - 1)
        @posts = posts[init..offset]
        if @page > 1
          @previous_page = @page - 1
          @previous_page_path = @previous_page == 1 ? template_url : permalink.sub(':num', @previous_page.to_s)
        end
        if @page < @total_pages
          @next_page = @page + 1
          @next_page_path = permalink.sub(':num', @next_page.to_s)
        end
        @first_page = 1
        @first_page_path = template_url
        @last_page = @total_pages
        @last_page_path = permalink.sub(':num', @total_pages.to_s)
      end

      def page_trail=(trail)
        @page_trail=trail
      end

      def to_liquid
        { 'per_page' => per_page, 'posts' => posts, 'total_posts' => total_posts, 'total_pages' => total_pages, 'page' => page, 'page_path' => page_path,
          'previous_page' => previous_page, 'previous_page_path' => previous_page_path, 'next_page' => next_page, 'next_page_path' => next_page_path,
          'first_page' => first_page, 'first_page_path' => first_page_path, 'last_page' => last_page, 'last_page_path' => last_page_path, 'page_trail' => page_trail }
      end
    end

    class PagedPage < Page

      def initialize(template, pager)
        @site = template.site
        @base = template.site.source
        @dir = '/pages/'
        @basename = 'index'
        @ext = '.html'
        @name = @basename + @ext
        @path = site.in_source_dir(@base, @dir, @name)
        @data = Jekyll::Utils.deep_merge_hashes(template.data, {} )
        @content = template.content
        @pager = pager
        @url = pager.page_path
        #Jekyll::Hooks.trigger :pages, :post_init, self
      end
    end

    class PagedPageGenerator < Jekyll::Generator
      safe true
      priority :lowest

      def generate(site)
        site.pages.select do |page|
          page.data['pagination'].is_a?(Hash) && page.data['pagination']['enabled']
        end.each do |template|
          config = Jekyll::Utils.deep_merge_hashes(site.config['pagination'], template.data['pagination'])
          posts = template.data.fetch('posts', site.posts.docs.reverse)
          per_page = config['per_page'].to_i
          trail = config['trail'].to_i
          total_pages = (posts.size.to_f / per_page).ceil

          permalink = File.join(template.dir, config['permalink'])
          template.pager = Pager.new(1, per_page, total_pages, posts, permalink, template.url)
          pages = [template]
          for page in 2..total_pages do
            pages << PagedPage.new(template, Pager.new(page, per_page, total_pages, posts, permalink, template.url))
          end
          pages.each do |page|
            idx_from = [page.pager.page - trail / 2 - 1, 0].max
            idx_to = [idx_from + trail, total_pages ].min - 1
            idx_from = [idx_to - trail + 1, 0].max if (idx_to - idx_from) < trail -1
            # puts page.pager.page.to_s + ': ' + idx_from.to_s + '-' + idx_to.to_s
            page.pager.page_trail = pages[idx_from..idx_to].collect {|p| PageTrail.new(p.pager.page, p.pager.page_path)}
          end
          site.pages.concat(pages.drop(1))
        end
      end
    end

  end
end
