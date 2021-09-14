require 'twitter_cldr'

module Jekyll
  module SortFilter
    def collator_sort(input)
        collator = TwitterCldr::Collation::Collator.new(:cs)
        collator.sort(input)
    end
  end
end

Liquid::Template.register_filter(Jekyll::SortFilter)