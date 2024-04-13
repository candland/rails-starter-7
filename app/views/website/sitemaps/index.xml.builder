xml.instruct! :xml, version: "1.0"
xml.tag! "urlset", "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  site = Sitepress::Site.new(root_path: "app/content")
  site.resources.reject { _1.data.noindex }.each do |resource|
    xml.tag! "url" do
      xml.tag! "loc", path_url(resource.request_path)
      xml.lastmod resource.asset.updated_at.strftime("%F")
    end
  end
end
