module SitemapGenerator
  class Link
    class << self
      def generate(path, options = {})
        options.assert_valid_keys(:priority, :changefreq, :lastmod, :host, :default_host)
        default_host = Sitemap.default_host || options[:default_host]
        options.reverse_merge!(:priority => 0.5, :changefreq => 'weekly', :lastmod => Time.now, :host => default_host)
        {
          :path => path,
          :priority => options[:priority],
          :changefreq => options[:changefreq],
          :lastmod => options[:lastmod],
          :host => options[:host],
          :loc => URI.join(options[:host], path).to_s
        }
      end
    end
  end
end